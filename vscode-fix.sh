cd /usr/lib/x86_64-linux-gnu/
cp libxcb.so.1 ~
cp libxcb.so.1.1.0 ~
sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/x86_64-linux-gnu/libxcb.so.1
sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0
sudo cp libxcb.so.1.1.0 /usr/share/code
sudo cp libxcb.so.1 /usr/share/code

