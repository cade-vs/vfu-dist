#!/bin/sh

echo "-------------------------------------------------"
echo "Compiling VSTRING..."
make -C vstring
if [ -e vstring/libvstring.a ]; then
  echo "VSTRING compiled ok."
else
  echo "VSTRING compilation failed..."
fi

echo "-------------------------------------------------"
echo "Compiling VSLIB..."
make -C vslib
if [ -e vslib/libvslib.a ]; then
  echo "VSLIB compiled ok."
else
  echo "VSLIB compilation failed..."
fi

echo "-------------------------------------------------"
echo "Compiling YASCREEN..."
make -C yascreen
if [ -e yascreen/yascreen.a ]; then
  echo "VSLIB compiled ok."
else
  echo "VSLIB compilation failed..."
fi

echo "-------------------------------------------------"
echo "Compiling VFU..."
make -C vfu
if [ -e vfu/vfu ]; then
  echo "VFU compiled ok."
else
  echo "VFU compilation failed..."
fi
