all: README.md

README.md: 
	echo "# Peer-Graded Assignment: Guessing Game" > README.md
	echo "The *bash script* contains the following number of lines:" >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]"+ >> README.md
	echo "" >> README.md
	echo "This **README** file was made using the [[ make ]] command  on: " >> README.md 
	date >> README.md

clean:
	rm README.md
# Press tab and have no spaces in each line!
