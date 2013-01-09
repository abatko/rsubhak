# encoding: utf-8
require 'test_helper'

class RsubhakTest < Test::Unit::TestCase

	def test_strip_of_whitespace_from_hash_similar_to_rails_params
		input= {"utf8"=>"✓", "authenticity_token"=>"N2gqZ3+Zm8JDsXg94/7lB3AZSB5o3PLxPHPbDJRvhkI=", "corn"=>{"corn_category_id"=>"569", "country_name"=>" Canada ", "region_name"=>" Cowichan Valley ", "producer_name"=>" x ", "name"=>"La Crema", "year"=>"1700", "existing_grapeage_attributes"=>{"1010"=>{"leaf_varietal"=>{"name"=>" x ", "_delete"=>""}}}, "description"=>" hello ", "price_with_currency_and_commas"=>" $1,000.00 ", "remote_image_url"=>"", "existing_inventory_attributes"=>{"745"=>{"stockroom_id"=>" 84  ", "quantity_with_commas"=>" 1 "}, "746"=>{"stockroom_id"=>" 85 ", "quantity_with_commas"=>"2 "}, "747"=>{"stockroom_id"=>"86", "quantity_with_commas"=>" 3"}}, "publishable"=>"1"}, "commit"=>"Save this corn", "id"=>" 659 "}
		expect={"utf8"=>"✓", "authenticity_token"=>"N2gqZ3+Zm8JDsXg94/7lB3AZSB5o3PLxPHPbDJRvhkI=", "corn"=>{"corn_category_id"=>"569", "country_name"=>"Canada", "region_name"=>"Cowichan Valley", "producer_name"=>"x", "name"=>"La Crema", "year"=>"1700", "existing_grapeage_attributes"=>{"1010"=>{"leaf_varietal"=>{"name"=>"x", "_delete"=>""}}}, "description"=>"hello", "price_with_currency_and_commas"=>"$1,000.00", "remote_image_url"=>"", "existing_inventory_attributes"=>{"745"=>{"stockroom_id"=>"84", "quantity_with_commas"=>"1"}, "746"=>{"stockroom_id"=>"85", "quantity_with_commas"=>"2"}, "747"=>{"stockroom_id"=>"86", "quantity_with_commas"=>"3"}}, "publishable"=>"1"}, "commit"=>"Save this corn", "id"=>"659"}
		assert_equal expect,
			Rsubhak.rstrip(input)
	end

	def test_strip_of_whitespace_from_hash_of_nested_hashes_and_arrays
		input= {"utf8"=>"✓", "a"=>["b", "  c  "], "authenticity_token"=>"N2gqZ3+Zm8JDsXg94/7lB3AZSB5o3PLxPHPbDJRvhkI=", "corn"=>{"corn_category_id"=>"569", "country_name"=>" Canada ", "region_name"=>" Cowichan Valley ", "producer_name"=>" x ", "name"=>"La Crema", "year"=>"1700", "existing_grapeage_attributes"=>{"1010"=>{"leaf_varietal"=>{"name"=>" x ", "_delete"=>""}}}, "description"=>" hello ", "price_with_currency_and_commas"=>" $1,000.00 ", "remote_image_url"=>"", "existing_inventory_attributes"=>{"745"=>{"stockroom_id"=>" 84  ", "quantity_with_commas"=>" 1 "}, "746"=>{"stockroom_id"=>" 85 ", "quantity_with_commas"=>"2 "}, "747"=>{"stockroom_id"=>"86", "quantity_with_commas"=>" 3", "z"=>[" w", " x ", "y "]}}, "publishable"=>"1"}, "commit"=>"Save this corn", "id"=>" 659 "}
		expect={"utf8"=>"✓", "a"=>["b", "c"], "authenticity_token"=>"N2gqZ3+Zm8JDsXg94/7lB3AZSB5o3PLxPHPbDJRvhkI=", "corn"=>{"corn_category_id"=>"569", "country_name"=>"Canada", "region_name"=>"Cowichan Valley", "producer_name"=>"x", "name"=>"La Crema", "year"=>"1700", "existing_grapeage_attributes"=>{"1010"=>{"leaf_varietal"=>{"name"=>"x", "_delete"=>""}}}, "description"=>"hello", "price_with_currency_and_commas"=>"$1,000.00", "remote_image_url"=>"", "existing_inventory_attributes"=>{"745"=>{"stockroom_id"=>"84", "quantity_with_commas"=>"1"}, "746"=>{"stockroom_id"=>"85", "quantity_with_commas"=>"2"}, "747"=>{"stockroom_id"=>"86", "quantity_with_commas"=>"3", "z"=>["w", "x", "y"]}}, "publishable"=>"1"}, "commit"=>"Save this corn", "id"=>"659"}
		assert_equal expect,
			Rsubhak.rstrip(input)
	end

	def test_strip_of_whitespace_from_array_of_nested_hashes_and_arrays
		input= [" hello ", "   ",  {"utf8"=>"✓", "a"=>["b", "  c  "], "authenticity_token"=>"N2gqZ3+Zm8JDsXg94/7lB3AZSB5o3PLxPHPbDJRvhkI=", "corn"=>{"corn_category_id"=>"569", "country_name"=>" Canada ", "region_name"=>" Cowichan Valley ", "producer_name"=>" x ", "name"=>"La Crema", "year"=>"1700", "existing_grapeage_attributes"=>{"1010"=>{"leaf_varietal"=>{"name"=>" x ", "_delete"=>""}}}, "description"=>" hello ", "price_with_currency_and_commas"=>" $1,000.00 ", "remote_image_url"=>"", "existing_inventory_attributes"=>{"745"=>{"stockroom_id"=>" 84  ", "quantity_with_commas"=>" 1 "}, "746"=>{"stockroom_id"=>" 85 ", "quantity_with_commas"=>"2 "}, "747"=>{"stockroom_id"=>"86", "quantity_with_commas"=>" 3", "z"=>[" w", " x ", "y "]}}, "publishable"=>"1"}, "commit"=>"Save this corn", "id"=>" 659 "}]
		expect=["hello", "",  {"utf8"=>"✓", "a"=>["b", "c"], "authenticity_token"=>"N2gqZ3+Zm8JDsXg94/7lB3AZSB5o3PLxPHPbDJRvhkI=", "corn"=>{"corn_category_id"=>"569", "country_name"=>"Canada", "region_name"=>"Cowichan Valley", "producer_name"=>"x", "name"=>"La Crema", "year"=>"1700", "existing_grapeage_attributes"=>{"1010"=>{"leaf_varietal"=>{"name"=>"x", "_delete"=>""}}}, "description"=>"hello", "price_with_currency_and_commas"=>"$1,000.00", "remote_image_url"=>"", "existing_inventory_attributes"=>{"745"=>{"stockroom_id"=>"84", "quantity_with_commas"=>"1"}, "746"=>{"stockroom_id"=>"85", "quantity_with_commas"=>"2"}, "747"=>{"stockroom_id"=>"86", "quantity_with_commas"=>"3", "z"=>["w", "x", "y"]}}, "publishable"=>"1"}, "commit"=>"Save this corn", "id"=>"659"}]
		assert_equal expect,
			Rsubhak.rstrip(input)
	end

end

