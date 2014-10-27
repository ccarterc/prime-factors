#!/usr/bin/env ruby 
class Prime
	def initialize
		
	end

	def generate_table (starting_at, num_primes)
		nums = get_nums_from_to starting_at, num_primes
	end

	def get_nums_from_to (starting_from, num_primes)
		primes_found = 0
		prime_nums = []
		is_prime = true
		i = starting_from

		while primes_found < num_primes
			is_prime = true
			j = i - 1
			while j > 1
				if (i % j == 0)
					is_prime = false
				end
				
				j = j - 1
			end
			if (is_prime == true)
				prime_nums << i
				primes_found = primes_found + 1
			end

			i = i + 1
		end
		prime_nums
	end

	def get_multi_table (nums)		
		@cols = []
		num_cols = nums.length+1
		num_rows = num_cols
		col_index = 0
		row_index = 0
		@cols[0] = []
		@cols[0] << 0		
		while col_index < num_cols
			add_rows col_index, row_index, nums, num_rows			
			col_index = col_index + 1
		end
		@cols
	end
	def add_rows col_index, row_index, nums, num_rows
		while row_index < num_rows
			if col_index == 0
				if (row_index < num_rows - 1)
					@cols[0] << nums[row_index]
				end
			elsif row_index == 0
				temp = []
				temp << nums[col_index - 1]
				@cols << temp					
			else
				@cols[col_index] << (nums[col_index-1]*nums[row_index-1])
			end			
			row_index = row_index + 1				
		end		
	end
	def display_table cols, digits
		num_rows = cols.length		
		j = 0
		cols.each do |col|			
			tmp_str = ""			
			for i in 0..num_rows
				tmp_sub_str = cols[j][i].to_s
				while tmp_sub_str.length < digits
					tmp_sub_str = tmp_sub_str + " "
				end
				tmp_str << tmp_sub_str
			end
			j = j + 1
			tmp_str << "\n"
			puts tmp_str
		end
	end
end

Primes = Prime.new
nums = Primes.get_nums_from_to 2, 10
multi_rows = Primes.get_multi_table nums
Primes.display_table multi_rows, 6