# Voodoo lagfix extension

name='updated vold configuration file'
dest='/system/etc/vold.fstab'

extension_update_voldfstab()
{
	cp /voodoo/extensions/vold/vold.fstab $dest
	extension_post_install_voldfstab
}

extension_post_install_voldfstab()
{
	# make sure it's owned by root
	chown 0.0 $dest
	# sets the permissions
	chmod 644 $dest
	log "$name now installed"
}

install_condition()
{
	test -f $dest
}


if install_condition; then
	extension_update_voldfstab
else
	echo "not installing $name"
fi
