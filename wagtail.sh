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
git checkout 224f3f5c37468393e77e78b83f7ece4f8d85081c .
npm install
npm run build
python setup.py install
