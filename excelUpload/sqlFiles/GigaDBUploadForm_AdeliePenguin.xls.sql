insert into gigadb_user select 8, 'zhanggj@genomics.cn', '', 'Guojie', 'Zhang', 'BGI', '', 'FALSE', 'TRUE' where not exists ( select null from gigadb_user where id = 8 ); 
insert into image select 8, '100006_Pygoscelis_adeliae.jpg', 'Adelie penguin', 'http://eol.org/pages/1049602/overview', 'Public Domain, US Government', 'Michael Van Woert, 1998', '<a href="http://www.photolib.noaa.gov/htmls/corp2479.htm">NOAA Photo Library</a>' where not exists ( select null from image where id = 8 ); 
insert into dataset values( 8, 8, 8, '10.5524/100006', 'Genomic data from Adelie penguin (<em>Pygoscelis adeliae</em>). ', 'The Adelie penguin (<em>Pygoscelis adeliae</em>) is an iconic penguin of moderate stature and a tuxedo of black and white feathers.  The penguins are only found in the Antarctic region and surrounding islands.  Being very sensitive to climate change, and due to changes in their behavior based on minor shifts in climate, they are often used as a barometer of the Antarctic.

With its status as one of the adorable and cuddly flightless birds of Antarctica, they serve as a sticking point for conservationists, even though they are as of now low risk for endangerment.  The sequence of the penguin can be of use in understanding the genetic underpinnings of its evolutionary traits and adaptation to its extreme environment; its unique system of feathers; its prowess as a diver; and its sensitivity to climate change.  We hope that this genome data will further our understanding of one of the most remarkable creatures to waddle the planet Earth.', 39728447488, 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100006/', 'Published', 'GigaDBUploadForm_AdeliePenguin.xls', '0cfda5e42aad15ad34203413e0d80fb3', '2011/07/06', null, 1 );
insert into author select 213, 'Li, J', '', 1 where not exists ( select null from author where id = 213 ); 
insert into author select 214, 'Zhang, G', '', 2 where not exists ( select null from author where id = 214 ); 
insert into author select 215, 'Lambert, D', '', 3 where not exists ( select null from author where id = 215 ); 
insert into dataset_author values( 214, 8, 213 );
insert into dataset_author values( 215, 8, 214 );
insert into dataset_author values( 216, 8, 215 );
insert into dataset_author values( 217, 8, 154 );
insert into dataset_type values( 9, 8, 2 );
insert into species select 8, 9238, 'Adelie penguin', 'Adelie penguin', 'Pygoscelis adeliae' where not exists ( select null from species where id = 8 ); 
insert into sample select 154, 8, '', 'Pygoscelis_adeliae' where not exists ( select null from sample where id = 154 ); 
insert into dataset_sample values( 154, 8, 154 );
insert into file values( 663, 8, 154, 'readme.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100006/readme.txt', 'txt', 138, '', '2011/07/06', 1, 1, null );
insert into file values( 664, 8, 154, 'Pygoscelis_adeliae.scaf.fa.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100006/Pygoscelis_adeliae.scaf.fa.gz', 'fa', 367639441, '', '2011/07/06', 2, 3, null );
insert into dataset_project values( 4, 8, 2 );
