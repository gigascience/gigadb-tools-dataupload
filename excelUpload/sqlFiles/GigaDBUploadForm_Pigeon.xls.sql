insert into image select 26, '100007_Columba_livia.jpg', 'Domestic pigeon', 'http://commons.wikimedia.org/wiki/File:Danish_tumbler%28silver_barred%29.jpg', 'CC SA', 'jim gifford', 'Flickr as danish tumbler(silver barred)' where not exists ( select null from image where id = 26 ); 
insert into dataset values( 26, 8, 26, '10.5524/100007', 'Genomic data from the domestic pigeon (<em>Columba livia</em>).', 'The domestic pigeon (<em>Columba livia domestica</em>) is one of the most common birds on planet Earth, located on every continent besides Antarctica.  The sub-species sequenced was a breed known as the Danish Tumbler, a show pigeon with a distinct color markings.

The domestic pigeon genome sequence provides a better understanding of such a widespread creature, including certain mechanisms that scientists still fail to understand fully, such as the magnetosensitivity.  The sequencing data also presents insight into the species’ similarities to and differences from other birds, and to how breeding might have shaped its genome as this sub-species was taken from Asian colonies to Denmark 400 years ago and selectively bred.

In 2010, BGI used the whole genome shotgun sequencing and IlluminaHiseq 2000 system to generate 98X short reads for a Danish Tumbler.  The raw data was then used by the assembler SOAPdenovo to produce a draft assembly of 1.1 Gb with N50 scaffold length of 3.1Mb and N50 contig length of 22.4 Kb.  Based on the k-mer distribution of sequencing data, the genome size of <em>Columba livia</em> is estimated to be 1.3 Gb, suggesting the current assembly is about 84% complete.  The percentage of GC content (41.5%) and the percentage of repetitive content (8.7%) in the pigeon are also similar in nature to three other avian genomes (chicken, zebra finch, turkey); the uncovered regions of the genome appear to be enriched in repeats.  A total of 17,300 protein-coding genes are predicted in the assembly.', 33285996544, 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100007/', 'Published', 'GigaDBUploadForm_Pigeon.xls', '9d2ce0f21c0981f69b6dc5b05941dba8', '2011/07/06', null, 1 );
insert into author select 825, 'Li, C', '', 1 where not exists ( select null from author where id = 825 ); 
insert into author select 826, 'Gilbert, T', '', 3 where not exists ( select null from author where id = 826 ); 
insert into author select 827, 'Wang, T', '', 4 where not exists ( select null from author where id = 827 ); 
insert into dataset_author values( 860, 26, 825 );
insert into dataset_author values( 861, 26, 214 );
insert into dataset_author values( 862, 26, 826 );
insert into dataset_author values( 863, 26, 827 );
insert into dataset_type values( 29, 26, 2 );
insert into species select 24, 8932, 'Domestic pigeon', 'Rock pigeon', 'Columba livia' where not exists ( select null from species where id = 24 ); 
insert into sample select 453, 24, '', 'Danish Tumbler' where not exists ( select null from sample where id = 453 ); 
insert into dataset_sample values( 454, 26, 453 );
insert into file values( 6190, 26, 453, 'readme.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100007/readme.txt', 'txt', 133, '', '2011/07/06', 1, 1, null );
insert into file values( 6191, 26, 453, 'Columba_livia.scaf.fa.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100007/Columba_livia.scaf.fa.gz', 'fa', 312700177, '', '2011/07/06', 2, 3, null );
insert into dataset_project values( 10, 26, 2 );
