    #=== Delete all .vcd and .vvp files 
    file delete {*}[glob -nocomplain *.vcd *.vvp]
    puts "\[SUCCESS\] Successfully clean icarus"
