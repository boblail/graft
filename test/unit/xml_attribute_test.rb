require File.dirname(__FILE__) + '/../test_helper'

module Graft
  class XmlAttributeTest < Test::Unit::TestCase
    context "An instance of the Attribute class" do

      should "know the name of the attribute" do
        attr = XmlAttribute.new('foo')
        attr.name.should == :foo
      end
      
      should "have a default type class" do
        attr = XmlAttribute.new('foo')
        attr.type_class.should == Graft::Type::String
      end

      should "have a default source" do
        attr = XmlAttribute.new(:foo)
        attr.sources.should == ['foo']
      end
      
      should "be able to assign multiple sources" do
        attr = XmlAttribute.new(:foo, :string, ['foo1', 'foo2'])
        attr.sources.should == ['foo1', 'foo2']
      end

      should "pull the location from the source" do
        attr = XmlAttribute.new('foo')
        attr.location('foo').should == 'foo'
      end
      
      should "return the location when splitting" do
        attr = XmlAttribute.new('foo')
        attr.split('foo').should == ['foo', nil]
      end
      
      should "return the name for the location when splitting if the location isn't specified" do
        attr = XmlAttribute.new('foo')
        attr.split('@bar').should == ['foo', 'bar']
      end
      
      should "allow the setting of the location information" do
        attr = XmlAttribute.new('foo', :string, 'bar')
        attr.sources.should == ['bar']
      end
      
      should "allow the setting of the attribute value" do
        attr = XmlAttribute.new('foo')
        attr.attribute('@bogon').should == 'bogon'
      end
      
      should "use the location as the attribute" do
        attr = XmlAttribute.new('foo')
        attr.attribute('foo').should == 'foo'
      end
      
      should "use the attribute for the attribute if specified" do
        attr = XmlAttribute.new(:id, :string, '@nsid')
        attr.attribute('@nsid').should == 'nsid'
      end

      should "be able to retrieve the node from the path" do
        document = Hpricot.XML('<name>Bassdrive</name>')
        expected = document.at('name')
        
        attr = XmlAttribute.new(:name)
        attr.node_for(document, 'name').should == expected
      end
      
      should "be able to retrieve the node that contains the specified attribute" do
        document = Hpricot.XML('<user id="1337" />')
        expected = document.at('user')
        
        attr = XmlAttribute.new(:id)
        attr.node_for(document, '@id').should == expected
      end

      should "be able to retrieve the node for the specified attribute" do
        document = Hpricot.XML('<user nsid="1337" />')
        expected = document.at('user')
        
        attr = XmlAttribute.new(:id, :string, '@nsid')
        attr.node_for(document, '@nsid').should == expected
      end
      
      should "be able to pull simple values from an XML document" do
        document = Hpricot.XML('<name>Bassdrive</name>')
        attr = XmlAttribute.new(:name)
        attr.value_from(document).should == 'Bassdrive'
      end

      should "be able to pull an attribute value from the current XML node" do
        document = Hpricot.XML('<user id="1337" />')
        attr = XmlAttribute.new(:id)
        attr.value_from(document).should == '1337'
      end
        
      should "be able to pull a specific attribute value from the current XML node" do
        document = Hpricot.XML('<user nsid="1337" />')
        attr = XmlAttribute.new(:id, :string, '@nsid')
        attr.value_from(document).should  == '1337'
      end

      should "be able to pull an attribute value for a node and attribute" do
        document = Hpricot.XML('<station><genre slug="dnb">Drum & Bass</genre></station>')
        attr = XmlAttribute.new(:slug, :string, 'station/genre@slug')
        attr.value_from(document).should == 'dnb'
      end
        
      should "be able to pull a value from a nested XML node" do
        document = Hpricot.XML('<rsp><user>blip</user></rsp>')
        attr = XmlAttribute.new(:user)
        attr.value_from(document).should == 'blip'
      end
      
      should "return nil if it cannot find the specified node" do
        document = Hpricot.XML('<user id="1" />')
        attr = XmlAttribute.new(:photoset, :string, '@nsid')
        attr.value_from(document).should be(nil)
      end

      should "be able to try a series of nodes to find a value" do
        document = Hpricot.XML('<photoid>123</photoid>')

        attr = XmlAttribute.new(:id, :string, ['photo@nsid', 'photoid'])
        attr.value_from(document).should == '123'
      end
      
      should "be able to convert an integer value" do
        document = Hpricot.XML('<id>1</id>')
        
        attr = XmlAttribute.new(:id, :integer)
        attr.value_from(document).should == 1
      end
      
      should "be able to convert a boolean value" do
        document = Hpricot.XML('<active>true</active>')
        
        attr = XmlAttribute.new(:active, :boolean)
        attr.value_from(document).should == true
      end

      should "be able to convert a date value" do
        document = Hpricot.XML('<due_on>2009-08-01</due_on>')
        
        attr = XmlAttribute.new(:due_on, :date)
        attr.value_from(document).should == Date.parse('2009-08-01')
      end
      
      should "be able to convert a time value" do
        document = Hpricot.XML('<created_at>2009-08-01 00:00:00</created_at>')
        
        attr = XmlAttribute.new(:created_at, :time)
        attr.value_from(document).should == Time.parse('2009-08-01 00:00:00')
      end

    end
  end
end