# The File.open method can open the file in different modes:
# 'r' Read-only, starts at beginning of file (default)
# 'r+' Read/Write, starts at beginning of file;
# 'w' Write-only, truncates existing file to zero length or creates a new file for writing

# read file
f = File.open("test.txt")
text = f.read
f.close
puts text

# write file
File.open("test.txt", "r+") { |f| f.write("new text after f.write") }

