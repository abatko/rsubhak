class Rsubhak

	##
	# Recursively traverse a hash or array *ha* (potentially of other nested
	# hashes and/or arrays), searching for all occurrences of hash key *k*,
	# and substituting (within their values) all occurrences of pattern *p*
	# for replacement *r*.
	#
	# ==== Parameters
	# *ha*:: hash or array
	# *k*:: hash key
	# *p*:: pattern
	# *r*:: replacement
	#
	# ==== Examples
	#   rsubhak(params, 'price', /[€\.]/, '')
	#   rsubhak(params, 'price', /,/, '.')
	#
	#   rsubhak(params, 'price', /[\$,]/, '')
	#
	# ==== Pronunciation
	# r sub hak
	#
	def self.rsubhak(ha, k, p, r)
		case ha
		when Hash
			ha[k].gsub!(p, r) if ha[k] # base case
			ha.each { |key, value|
				case value
				when Hash
					rsubhak(ha[key], k, p, r)
				when Array
					rsubhak(value, k, p, r)
				end
			}
		when Array
			ha.each { |i|
				rsubhak(i, k, p, r) if i.class == Hash || i.class == Array
			}
		end
	end

	##
	# Recursively traverse a hash or array *ha* (potentially of other nested
	# hashes and/or arrays), searching for all values that respond to *strip*,
	# and calling *strip!* on them to remove leading and trailing whitespace.
	#
	# ==== Parameters
	# *ha*:: hash or array
	#
	# ==== Examples
	#   rstrip(params)
	#
	# ==== Pronunciation
	# r strip
	#
	def self.rstrip(ha)
		case ha
		when Hash
			ha.each { |key, value|
				case value
				when Hash
					self.rstrip(ha[key])
				when Array
					self.rstrip(value)
				else
					value.strip! if value.respond_to?(:strip) # base case
				end
			}
		when Array
			ha.each_with_index { |item, index|
				if item.class == Hash || item.class == Array
					self.rstrip(item)
				elsif item.respond_to?(:strip) # base case
					ha[index].strip!
				end
			}
		end
	end
end

