# Things to do outside dotfiles

* Look at the headings of files in etc_specific
* Change sudoers file

# Arch specific

* Change '#Color' to 'Color' in /etc/pacman.conf
* Add 'ILoveCandy' to the list of options for a pacman easter egg

# HP Laptop specific

* Do the following and run `grub-mkconfig -o /boot/grub/grub.cfg`

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet acpi_backlight=vendor acpi_osi=Linux"
```
