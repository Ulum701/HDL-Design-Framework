
    # -force is required to delete non-empty directories
    file delete -force work
    file delete transcript
    file delete vsim.wlf
    file delete modelsim.ini
    puts "\[SUCCESS\] Successfully clean questa"
