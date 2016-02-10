apt-get update
apt-get install sudo
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs
PYPATH=$(python -c "import site; print(site.getsitepackages()[0])")
echo PYPATH: $PYPATH
cd $PYPATH
rm -rf wagtail || true
git clone https://github.com/torchbox/wagtail.git
cd wagtail
npm install
npm run build
python setup.py install
