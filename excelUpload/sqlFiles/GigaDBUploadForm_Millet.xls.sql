update image set id = 22, location = '100020_Setaria_italica.jpg', tag = 'Foxtail millet', url = 'http://eol.org/pages/1114673/overview', license = 'GNU Free Documentation License, CC SA', photographer = 'Markus Hagenlocher', source = 'Wikimedia Commons'  where id = 22 ; 
update dataset set id = 22, submitter_id = 14, image_id = 22, identifier = '10.5524/100020', title = 'Genome data from foxtail millet (<em>Setaria italica</em>).', description = 'Foxtail millet (<em>Setaria italica</em>) (2n=18), is an annual grass grown both as cereal crop (grain production) and as forage food.  It is primarily grown in temperate, subtropical and tropical areas.  With approximately 6,000 varieties, millet is one member of the Panicoideae (grasses subfamily), which includes maize (<em>Zea mays</em>), sorghum (<em>Sorghum bicolor</em>), and sugar cane (<em>Saccharum officinarum</em>).  It is a nutritious dietary staple, containing starch, proteins, and a number of vitamins and minerals, such as calcium, iron, and sodium.  It feeds nearly one-third of the world population with main daily-calories intake, and is especially prevalent in dry climates or soil-poor regions that are not suited for the cultivation of many other crops.  Millet is self-pollinating, has a short lifecycle, is small in stature, and has a small genome size; all of these useful attributes make it an invaluable functional genomics model system, and an excellent reference genome to aid in the sequencing of other larger grasses genomes.', dataset_size = 60129542144, ftp_site = 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100020/', upload_status = 'Published', excelfile = 'GigaDBUploadForm_Millet.xls', excelfile_md5 = '6439431f9bbffcabbf525ba982ed6896', publication_date = '2011/11/12', modification_date = null, publisher_id = 1  where id = 22 ; 
delete from dataset_author where dataset_id='22'
insert into dataset_author values( 681, 22, 650 );
insert into dataset_author values( 682, 22, 651 );
insert into dataset_author values( 683, 22, 652 );
insert into dataset_author values( 684, 22, 653 );
insert into dataset_author values( 685, 22, 654 );
insert into dataset_author values( 686, 22, 655 );
insert into dataset_author values( 687, 22, 656 );
insert into dataset_author values( 688, 22, 657 );
insert into dataset_author values( 689, 22, 658 );
insert into dataset_author values( 690, 22, 575 );
insert into dataset_author values( 691, 22, 14 );
insert into dataset_author values( 692, 22, 659 );
insert into dataset_author values( 693, 22, 660 );
delete from relation where dataset_id='22'
delete from link where dataset_id='22'
insert into link values( 46, 22, 'TRUE', 'PROJECT:PRJNA77795' );
insert into link values( 47, 22, 'TRUE', 'PROJECT:PRJNA73995' );
insert into link values( 48, 22, 'FALSE', 'SRA:SRA048234' );
delete from dataset_type where dataset_id='22'
insert into dataset_type values( 44, 22, 1 );
delete from external_link where dataset_id='22'
insert into external_link values( 9, 22, 'http://foxtailmillet.genomics.org.cn/', 2 );
delete from manuscript where dataset_id='22'
insert into manuscript values( 19, '10.1038/nbt.2195', 22580950, 22 );
update sample set id = 432, species_id = 20, s_attrs = '', code = 'Zhang gu'  where id = 432 ; 
delete from dataset_sample where dataset_id='22'
insert into dataset_sample values( 433, 22, 432 );
delete from file where dataset_id='22'
insert into file values( 5102, 22, 432, 'readme.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100020/readme.txt', 'txt', 526, '', '2011/11/12', 1, 1, null );
insert into file values( 5103, 22, 432, 'Millet_scaffoldVersion2.3.fa.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100020/Millet_scaffoldVersion2.3.fa.gz', 'fa', 114680840, '', '2011/11/12', 2, 3, null );
insert into file values( 5104, 22, 432, 'millet.chr.version2.3.fa.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100020/millet.chr.version2.3.fa.gz', 'fa', 115262131, '', '2011/11/12', 2, 3, null );
insert into file values( 5105, 22, 432, 'millet.version2.agp', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100020/millet.version2.agp', 'agp', 32173, '', '2011/11/12', 16, 3, null );
insert into file values( 5106, 22, 432, 'Millet.fa.glean.cds.v3.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100020/Millet.fa.glean.cds.v3.gz', 'cds', 13737681, '', '2011/11/12', 2, 4, null );
insert into file values( 5107, 22, 432, 'Millet.fa.glean.pep.v3.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100020/Millet.fa.glean.pep.v3.gz', 'pep', 8915530, '', '2011/11/12', 2, 5, null );
insert into file values( 5108, 22, 432, 'Millet.fa.glean.v3.gff', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100020/Millet.fa.glean.v3.gff', 'gff', 14721782, '', '2011/11/12', 5, 6, null );
delete from dataset_project where dataset_id='22'
