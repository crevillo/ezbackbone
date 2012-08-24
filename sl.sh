#Symlinks sur tous les fichiers sauf settings/ et extension/
for f in $( ls ezp | egrep -i -v "extension|settings|var|config.php-RECOMMENDED|kickstart.ini-dist|LICENSE|README.txt|.htaccess_root"); do
echo "Symlink $f"
ln -s ezp/$f ./$f
done


