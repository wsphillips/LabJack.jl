using LabJack

#lsdev()

dev = open(dtANY, ctANY)

write_digital("EIO0", 0, dev)

write_analog("TDAC1", 5.0, dev)

read_digital("EIO0")
