@test = []

def make_perm(n, m = 0, perm = [1])
  if n == m
    @test.push(perm.dup << 1)
  else
    for x in 2 .. n + 1
      next if perm.member?(x)
      perm.push(x)
      make_perm(n, m + 1, perm)
      perm.pop
    end
  end
end

def calc_perm(n,m)

cost_matrix = [
[ 0, 7, 12, 8, 11, 7 ],
[ 3, 0, 10, 7, 13, 2 ],
[ 4, 8, 0, 9, 12, 3 ],
[ 6, 6, 9, 0, 10, 7 ],
[ 7, 7, 11, 10, 0, 5 ],
[ 9, 7, 8, 9, 10, 0 ],
]

  return cost_matrix[n-1][m-1]

end

min = 9999
min_p = []
make_perm(5)
@test.each{ |oo|
 print oo
 s = 0
 sum = 0
 oo.each{ |ee|
  if s == 0 
    s = ee
  else
    e = ee
    sum = sum + calc_perm(s.to_i,ee.to_i)
    s = e
  end
 }
 print '⇒',sum,"\n"
 if sum < min then
   min = sum
   min_p = oo
 end
}

print '-------------------------',"\n"
print '最短経路：'
print min_p,'⇒', min,"\n"

