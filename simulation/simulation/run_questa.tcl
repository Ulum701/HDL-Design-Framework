
# Definition toplevel testbench. Edit the top level, direction etc. here
set toplevel "define top level here eg. tb_fifo"
set testbench_direction "define top level here eg. ../testbench/"

# Definition design
set folder_path "../hdl"
set file_list [glob -nocomplain -directory $folder_path -types f *]

puts "=== Create Work Library ==="
puts "\[Running\] Creating work library"
exec vlib work
exec vmap work work
puts "\[Done\] Creating work library"

puts "=== Compiling Testbench ==="
exec vlog $testbench_direction$toplevel.v
puts "\[Running\] Compiling $toplevel.v"
puts "\[Done\] Compiling $toplevel.v"

puts "=== Compiling Design ==="
if {[llength $file_list] > 0} {
    puts "Found [llength $file_list] file(s):"
    foreach f $file_list {
        puts "\[Running\] Compiling $f"
        exec vlog $f
        puts "\[Done\] Compiling $f"
    }
} else {
    puts "No hdl file(s) found in $folder_path!"
}

puts "=== Launch Simulation ==="
puts "\[Running\] Opening Questa"
exec vsim -voptargs="+acc" work.$toplevel -gui -do "add wave -r /*; run -all; wave zoomfull;"