# toplevel definition. Edit the top level, direction, etc. here
set toplevel "define top here eg.tb_top"
set toplevel_direction "define toplevel direction eg. ../testbench/"

# Run compile command
puts "=== TCL Compiling Design ==="
puts "\[Running\] Compiling design"
if {[catch {exec iverilog -o $toplevel.vvp $toplevel_direction$toplevel.v} msg_c_error]} {
    puts stderr "\[FAIL\] Compilation Error: \n $msg_c_error"
    return
}
puts "\[Done\] Compiling design"
# Run simulation command
puts "=== TCL Running Simulation ==="
puts "\[Running\] Simulation design"
if {[catch {exec vvp $toplevel.vvp >@ stdout} msg_s_error]} {
    puts stderr "\[FAIL\] Simulation Error: \n $msg_s_error"
    return
}
puts "\[Done\] Simulation design"
# Open waveform command
puts "=== TCL Opening Waveform Diagram ==="
puts "\[Running\] Opening Waveform diagram"
if {[catch {exec gtkwave $toplevel.vcd} msg_w_error]} {
    puts stderr "\[FAIL\] Waveform Error: \n $msg_w_error"
    return
}