# make a new directory
mkdir count_example
cd count_example
cp /usr/lib/hadoop/hadoop-examples-1.0.2.jar .
cp /usr/lib/hadoop/contrib/streaming/hadoop-streaming-1.0.2.jar .

# get the files (could be done with a git clone, but wget is more prevalent than git for now)
wget -o /dev/null http://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/mapper.py
wget -o /dev/null http://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/reducer.py
wget -o /dev/null http://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/reducer_numsort.py
wget -o /dev/null http://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/hamlet.txt
chmod u+x *.py

# put the data in
hadoop fs -mkdir count_example
hadoop fs -put hamlet.txt count_example

# EXTRA (wikipedia titles)
wget http://download.wikimedia.org/enwiki/latest/enwiki-latest-all-titles-in-ns0.gz -O - | gunzip -c | hadoop fs -put - count_example/wiki_titles

cd ..

