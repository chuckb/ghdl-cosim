#!/usr/bin/env sh

set -e

cd $(dirname "$0")

echo "Analyze valuesFromVhdlToC.vhd"
ghdl -a --std=08 -O0 -g valuesFromVhdlToC.vhd

echo "Build tb (with valuesFromVhdlToC.c and headers)"
ghdl -e --std=08 -O0 -g -Wl,-I../../ -Wl,valuesFromVhdlToC.c -o tb_valuesFromVhdlToC tb_valuesFromVhdlToC

echo "Execute tb"
./tb_valuesFromVhdlToC


echo "Analyze valuesFromVhdlToC.vhd"
ghdl -a --std=08 -O0 -g accessesFromVhdlToC.vhd

echo "Build tb (with accessesFromVhdlToC.c and headers)"
ghdl -e --std=08 -O0 -g -Wl,-I../../ -Wl,accessesFromVhdlToC.c -o tb_accessesFromVhdlToC tb_accessesFromVhdlToC

echo "Execute tb"
./tb_accessesFromVhdlToC
