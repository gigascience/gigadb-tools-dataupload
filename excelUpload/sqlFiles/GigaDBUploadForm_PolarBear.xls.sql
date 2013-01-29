insert into image select 27, '100008_Ursus_maritimus.jpg', 'Polar bear', 'http://eol.org/pages/328580/overview', 'CC BY-SA', 'Alan D. Wilson', 'Wikimedia Commons' where not exists ( select null from image where id = 27 ); 
insert into dataset values( 27, 8, 27, '10.5524/100008', 'Genomic data from the polar bear (<em>Ursus maritimus</em>).', 'The polar bear (<em>Ursus maritimus</em>) is one of the largest land carnivores, second only to the Alaskan brown bear.  In an effort to adapt to the extremely cold Arctic environment, it has evolved many unique characteristics.  However, ecological pressures pose a grave threat to the survival of polar bears.  The polar bear genome provides significant contributions to research concerning evolution, biodiversity and climate change.

In 2010, the BGI completed the first draft of the genome sequence of a 25 years old male polar bear.  Using next-generation sequencing technology (Illumina GA) to obtain about 101-fold genome coverage, and SOAPdenovo, the self-developed short reads assembly method, a high quality draft genome sequence was assembled with an N50 scaffold size of 15.9 megabases (Mb), and function elements annotation was finished.  A reference gene set that contained around 21,000 genes for the polar bear was predicted.  The transposable elements comprised approximately 37% of the polar bear genome.', 33285996544, 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100008/', 'Published', 'GigaDBUploadForm_PolarBear.xls', '113a6a83b2fd8e13c00fc466e86c0c64', '2011/07/06', null, 1 );
insert into author select 828, 'Li, B', '', 1 where not exists ( select null from author where id = 828 ); 
insert into author select 829, 'Willersleve, E', '', 3 where not exists ( select null from author where id = 829 ); 
insert into author select 830, 'Wang, J', '', 5 where not exists ( select null from author where id = 830 ); 
insert into dataset_author values( 864, 27, 828 );
insert into dataset_author values( 865, 27, 214 );
insert into dataset_author values( 866, 27, 829 );
insert into dataset_author values( 867, 27, 154 );
insert into dataset_author values( 868, 27, 830 );
insert into dataset_type values( 30, 27, 2 );
insert into external_link values( 15, 27, 'http://climb.genomics.cn/Agilefox1.2.0/main.html?species=1', 2 );
insert into species select 25, 29073, 'Polar bear', 'polar bear', 'Ursus maritimus' where not exists ( select null from species where id = 25 ); 
insert into sample select 454, 25, '', 'polar bear' where not exists ( select null from sample where id = 454 ); 
insert into dataset_sample values( 455, 27, 454 );
insert into file values( 6192, 27, 454, 'readme.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100008/readme.txt', 'txt', 136, '', '2011/07/06', 1, 1, null );
insert into file values( 6193, 27, 454, 'Ursus_maritimus.scaf.fa.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100008/Ursus_maritimus.scaf.fa.gz', 'fa', 649880228, '', '2011/07/06', 2, 3, null );
insert into dataset_project values( 11, 27, 2 );
