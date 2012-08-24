#ajout d'ezpublish dans un sous-module
git submodule add -b stable-4.4 https://github.com/ezsystems/ezpublish.git ezp

#Symlinks sur tous les fichiers sauf settings/ et extension/
for f in $( ls ezp | egrep -i -v "extension|settings|var|config.php-RECOMMENDED|kickstart.ini-dist|LICENSE|README.txt|.htaccess_root"); do
echo "Symlink $f"
ln -s ezp/$f ./$f
done

#Symlinks sur tous les .ini par défaut
mkdir settings
mkdir settings/override

cd settings
for f in $( ls ../ezp/settings | grep -i -v "override"); do
echo "Symlink settings/$f"
ln -s ../ezp/settings/$f ./$f
done
cd ..

echo "Copie du dossier var"
cp -R ezp/var ./var

echo "Creation du dossier extension"
mkdir extension
cd extension
touch dummy.txt

