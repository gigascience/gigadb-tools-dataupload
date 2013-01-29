update image set id = 1, location = '100043_Trichinella spiralis.jpg', tag = 'Life cycle of Trichinella spiralis', url = 'http://eol.org/pages/2926813/overview', license = 'Public domain', photographer = 'Unknown', source = 'Public Health Image Library'  where id = 1 ; 
update dataset set id = 1, submitter_id = 1, image_id = 1, identifier = '10.5524/100043', title = 'Bisulfite-PCR combined with cloning Sanger sequencing data for validating DNA methylation level in <em>Trichinella spiralis</em>.', description = '<em>Trichinella spiralis</em> is the smallest nematode parasite of humans and is also infectious in the rat, pig and bear species. Responsible for the disease trichinosis, it is often referred to as the “pork worm” due to infection usually being caused by the consumption of undercooked pork products. Adults mature in the intestines of an intermediate host, and each female produces batches of larvae that bore through the intestinal wall and the lymphatic system. They are then carried to striated muscle where they encyst.

To date 5''-cytosine methylation (5mC) has not been reported in <em>Caenorhabditis elegans</em>, and using ultra-performance liquid chromatography/tandem mass spectrometry (UPLC-MS/MS) the existence of DNA methylation in <em>T. spiralis</em> was detected, making it the first 5mC reported in any species of nematode. Technological advances now enable the high-resolution detection of 5''-cytosine methylation, providing a stronger basis for examining the role of DNA methylation in eukaryotic genomes such as these. 

Using MethylC-seq, here we present the first comprehensive study that confirms the existence of DNA methylation in the parasitic nematode, <em>T. spiralis</em> and we characterised the methylomes during the three life-cycle stages of this food-borne infectious parasite of humans. We generated 61.65, 23.52 and 55.77 million raw reads, almost all of which (96.36%, 91.30% and 99.27%, respectively) were able to be aligned to the <em>T. spiralis</em> reference sequence, yielding 2.91, 1.05 and 2.71 Gb of DNA sequence data for the three life-cycle stages. To further validate the DNA methylation level we randomly selected genomic regions and performed Bisulfite-PCR combined with cloning Sanger sequencing. This additional data further supports the existence of DNA methylation in the parasitic nematode, <em>T. spiralis</em>.', dataset_size = 348160, ftp_site = 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043', upload_status = 'Published', excelfile = 'GigaDBUploadForm_ParasiticNematode.xls', excelfile_md5 = '4968b6a3df8e2f82030d98be10bbfdbf', publication_date = '2012/10/08', modification_date = null, publisher_id = 1  where id = 1 ; 
delete from dataset_author where dataset_id='1'
insert into dataset_author values( 1, 1, 1 );
insert into dataset_author values( 2, 1, 2 );
insert into dataset_author values( 3, 1, 3 );
delete from relation where dataset_id='1'
delete from link where dataset_id='1'
insert into link values( 1, 1, 'TRUE', 'PROJECT:PRJNA170655' );
insert into link values( 2, 1, 'TRUE', 'GEO:GSE39328' );
insert into link values( 3, 1, 'FALSE', 'SRA:SRP014316' );
delete from dataset_type where dataset_id='1'
insert into dataset_type values( 1, 1, 1 );
delete from external_link where dataset_id='1'
delete from manuscript where dataset_id='1'
insert into manuscript values( 1, '10.1186/gb-2012-13-10-r100', 23075480, 1 );
update sample set id = 1, species_id = 1, s_attrs = 'GEO Accession="GSM961040",age="new-born larvae",description="source: new-born larvae"', code = 'SAMPLE:SRS350162'  where id = 1 ; 
update sample set id = 2, species_id = 1, s_attrs = 'GEO Accession="GSM961039",age="muscle larvae",description="source: muscle larvae"', code = 'SAMPLE:SRS350161'  where id = 2 ; 
update sample set id = 3, species_id = 1, s_attrs = 'GEO Accession="GSM961038",age="adults",description="source: adults"', code = 'SAMPLE:SRS350160'  where id = 3 ; 
delete from dataset_sample where dataset_id='1'
insert into dataset_sample values( 1, 1, 2 );
insert into dataset_sample values( 2, 1, 1 );
insert into dataset_sample values( 3, 1, 3 );
delete from file where dataset_id='1'
insert into file values( 1, 1, null, 'readme.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/readme.txt', 'txt', 1195, '', '2012-10-08', 1, 1, null );
insert into file values( 2, 1, 3, 'Ad.ABIR02000010.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/Ad.ABIR02000010.1.region.fa', 'fa', 3573, '', '2012-10-08', 2, 2, null );
insert into file values( 3, 1, 3, 'Ad.ABIR02000831.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/Ad.ABIR02000831.1.region.fa', 'fa', 2997, '', '2012-10-08', 2, 2, null );
insert into file values( 4, 1, 3, 'Ad.ABIR02000918.1.region1.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/Ad.ABIR02000918.1.region1.fa', 'fa', 3468, '', '2012-10-08', 2, 2, null );
insert into file values( 5, 1, 3, 'Ad.ABIR02000918.1.region2.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/Ad.ABIR02000918.1.region2.fa', 'fa', 10329, '', '2012-10-08', 2, 2, null );
insert into file values( 6, 1, 3, 'Ad.ABIR02001814.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/Ad.ABIR02001814.1.region.fa', 'fa', 7363, '', '2012-10-08', 2, 2, null );
insert into file values( 7, 1, 3, 'Ad.ABIR02004848.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/Ad.ABIR02004848.1.region.fa', 'fa', 4125, '', '2012-10-08', 2, 2, null );
insert into file values( 8, 1, 2, 'ML.ABIR02000010.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/ML.ABIR02000010.1.region.fa', 'fa', 3398, '', '2012-10-08', 2, 2, null );
insert into file values( 9, 1, 2, 'ML.ABIR02000831.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/ML.ABIR02000831.1.region.fa', 'fa', 4992, '', '2012-10-08', 2, 2, null );
insert into file values( 10, 1, 2, 'ML.ABIR02000918.1.region1.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/ML.ABIR02000918.1.region1.fa', 'fa', 4714, '', '2012-10-08', 2, 2, null );
insert into file values( 11, 1, 2, 'ML.ABIR02000918.1.region2.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/ML.ABIR02000918.1.region2.fa', 'fa', 10024, '', '2012-10-08', 2, 2, null );
insert into file values( 12, 1, 2, 'ML.ABIR02001814.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/ML.ABIR02001814.1.region.fa', 'fa', 9639, '', '2012-10-08', 2, 2, null );
insert into file values( 13, 1, 2, 'ML.ABIR02004848.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/ML.ABIR02004848.1.region.fa', 'fa', 3849, '', '2012-10-08', 2, 2, null );
insert into file values( 14, 1, 1, 'NBL.ABIR02000010.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/NBL.ABIR02000010.1.region.fa', 'fa', 2951, '', '2012-10-08', 2, 2, null );
insert into file values( 15, 1, 1, 'NBL.ABIR02000831.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/NBL.ABIR02000831.1.region.fa', 'fa', 6675, '', '2012-10-08', 2, 2, null );
insert into file values( 16, 1, 1, 'NBL.ABIR02000918.1.region1.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/NBL.ABIR02000918.1.region1.fa', 'fa', 1919, '', '2012-10-08', 2, 2, null );
insert into file values( 17, 1, 1, 'NBL.ABIR02000918.1.region2.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/NBL.ABIR02000918.1.region2.fa', 'fa', 11404, '', '2012-10-08', 2, 2, null );
insert into file values( 18, 1, 1, 'NBL.ABIR02001814.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/NBL.ABIR02001814.1.region.fa', 'fa', 8436, '', '2012-10-08', 2, 2, null );
insert into file values( 19, 1, 1, 'NBL.ABIR02004848.1.region.fa', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/fa/NBL.ABIR02004848.1.region.fa', 'fa', 4024, '', '2012-10-08', 2, 2, null );
insert into file values( 20, 1, 3, 'Me_BSP_BS.ABIR02000010.1.region.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/methy_info/Me_BSP_BS.ABIR02000010.1.region.txt', 'txt', 1376, '', '2012-10-08', 1, 2, null );
insert into file values( 21, 1, 3, 'Me_BSP_BS.ABIR02000831.1.region.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/methy_info/Me_BSP_BS.ABIR02000831.1.region.txt', 'txt', 1147, '', '2012-10-08', 1, 2, null );
insert into file values( 22, 1, 3, 'Me_BSP_BS.ABIR02000918.1.region1.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/methy_info/Me_BSP_BS.ABIR02000918.1.region1.txt', 'txt', 2264, '', '2012-10-08', 1, 2, null );
insert into file values( 23, 1, 3, 'Me_BSP_BS.ABIR02000918.1.region2.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/methy_info/Me_BSP_BS.ABIR02000918.1.region2.txt', 'txt', 2484, '', '2012-10-08', 1, 2, null );
insert into file values( 24, 1, 3, 'Me_BSP_BS.ABIR02001814.1.region.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/methy_info/Me_BSP_BS.ABIR02001814.1.region.txt', 'txt', 1884, '', '2012-10-08', 1, 2, null );
insert into file values( 25, 1, 3, 'Me_BSP_BS.ABIR02004848.1.region.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/methy_info/Me_BSP_BS.ABIR02004848.1.region.txt', 'txt', 1688, '', '2012-10-08', 1, 2, null );
insert into file values( 26, 1, null, 'UPLC-MS chromatograms of DNA hydrolysate from Ad and NBL.pdf', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/UPLC-MS/UPLC-MS chromatograms of DNA hydrolysate from Ad and NBL.pdf', 'pdf', 159753, '', '2012-10-08', 3, 2, null );
insert into file values( 27, 1, null, 'UPLC-MS chromatograms of DNA hydrolysate from Ad and NBL.xlsx', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100043/UPLC-MS/UPLC-MS chromatograms of DNA hydrolysate from Ad and NBL.xlsx', 'xlsx', 11761, '', '2012-10-08', 4, 2, null );
delete from dataset_project where dataset_id='1'
