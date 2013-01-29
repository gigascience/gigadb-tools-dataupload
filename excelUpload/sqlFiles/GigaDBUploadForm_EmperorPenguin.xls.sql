insert into image select 16, '100005_Aptenodytes_forsteri.jpg', 'Emperor penguins', 'http://commons.wikimedia.org/wiki/File:Emperor_penguin.jpg', 'Public Domain, US Government', 'Michael Van Woert, 1999', '<a href="http://www.photolib.noaa.gov/htmls/corp2566.htm">NOAA Photo Library</a>' where not exists ( select null from image where id = 16 ); 
insert into dataset values( 16, 8, 16, '10.5524/100005', 'Genomic data from the Emperor penguin (<em>Aptenodytes forsteri</em>).', 'The Emperor penguin (<em>Aptenodytes forsteri</em>) is a large penguin, standing over 1 meter tall, with distinctive black, yellow and white markings.  Like most penguins, the emperor penguins are indigenous to Antarctica and exist between the 66th and 78th parallels.

Famous for its unique social and reproductive behavior, the emperor penguin also possesses a number of other notable evolutionary qualities: its stature, its feathers, its incubation process, and its swimming capabilities.  The <em>Aptenodytes forsteri</em> genome offers new insights into this remarkable bird.', 39728447488, 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100005/', 'Published', 'GigaDBUploadForm_EmperorPenguin.xls', '885969f9bdbed91a3c74d503958a3729', '2011/07/06', null, 1 );
insert into dataset_author values( 605, 16, 213 );
insert into dataset_author values( 606, 16, 214 );
insert into dataset_author values( 607, 16, 215 );
insert into dataset_author values( 608, 16, 154 );
insert into dataset_type values( 19, 16, 2 );
insert into species select 15, 9233, 'Emperor penguin', 'emperor penguin', 'Aptenodytes forsteri' where not exists ( select null from species where id = 15 ); 
insert into sample select 337, 15, '', 'Aptenodytes_forsteri' where not exists ( select null from sample where id = 337 ); 
insert into dataset_sample values( 337, 16, 337 );
insert into file values( 4340, 16, 337, 'readme.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100005/readme.txt', 'txt', 140, '', '2011/07/06', 1, 1, null );
insert into file values( 4341, 16, 337, 'Aptenodytes_forsteri.scaf.fa.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100005/Aptenodytes_forsteri.scaf.fa.gz', 'fa', 369587895, '', '2011/07/06', 2, 3, null );
insert into dataset_project values( 7, 16, 2 );
