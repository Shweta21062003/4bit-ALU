onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_4bit_tb/a
add wave -noupdate /alu_4bit_tb/b
add wave -noupdate /alu_4bit_tb/opcode
add wave -noupdate /alu_4bit_tb/result
add wave -noupdate /alu_4bit_tb/cout
add wave -noupdate /alu_4bit_tb/zero
add wave -noupdate /alu_4bit_tb/overflow
add wave -noupdate /alu_4bit_tb/a
add wave -noupdate /alu_4bit_tb/b
add wave -noupdate /alu_4bit_tb/opcode
add wave -noupdate /alu_4bit_tb/result
add wave -noupdate /alu_4bit_tb/cout
add wave -noupdate /alu_4bit_tb/zero
add wave -noupdate /alu_4bit_tb/overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {74847 ps} {85035 ps}
