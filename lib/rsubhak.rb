class Rsubhak

  ##
  # Recursively walk a hash or array *ha*, 
  # searching for all occurrences of hash key *k*, and substituting
  # (within their values) all occurrences of pattern *p* for replacement *r*.
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
      ha[k].gsub!(p, r) if ha[k]
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
end
