function tmpdir
set dirname "/tmp/$(random 1000000 9009999)"
mkdir -p "$dirname"
cd "$dirname"
end
