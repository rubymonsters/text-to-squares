kitty_toys = [
{:shape => 'sock', :fabric => 'chashmere'},
{:shape => 'mouse', :fabric => 'calico'},
{:shape => 'eggroll', :fabric => 'chenille'}
]


kitty_toys.each do |toy|
  puts %(Blixy has a #{toy[:shape]})
end
