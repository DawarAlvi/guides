## Adding SSH key to GitHub

Open terminal in .ssh/ and run
`ssh-keygen -b 4096 -t rsa`

In GitHub create new SSH key from account settings -> SSH and GPG Keys
paste in the contents of id_rsa.pub file
