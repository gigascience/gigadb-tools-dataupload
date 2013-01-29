update image set id = 37, location = '100013_YH.jpg', tag = 'Han Chinese individual', url = 'http://commons.wikimedia.org/wiki/File:Emperor_Gaozu_of_Han.jpg', license = 'public domain because its copyright has expired', photographer = 'Unknown', source = 'Wikimedia Commons, en:Image:HanGaozu.jpg'  where id = 37 ; 
update dataset set id = 40, submitter_id = 23, image_id = 37, identifier = '10.5524/100038', title = 'Updated genome assembly of YH: the first diploid genome sequence of a Han Chinese individual (version 2, 07/2012)', description = 'Updated genomic data from the YH <em>(Homo sapiens)</em> diploid genome – the first sequenced Han Chinese individual, a representative of the Asian population.  The genomic DNA used in this study came from an anonymous male Han Chinese individual who has no known genetic diseases.

The original version of the YH genome was assembled based on 3.3 billion reads using the Illumina Genome Analyzer (see dataset <a href="http://dx.doi.org/10.5524/100015" target="_blank">doi:10.5524/100015</a>).  This latest (as of 07/2012) and improved version of the YH genome was assembled based on 2.1 billion reads using the Illumina HiSeq2000. A total of 202G nucleotides data was achieved using 100 bp-long paired end reads with an insert size ranging from 180 bp to 40 kbp, and the genome was sequenced to 67.5-fold average coverage. The latest version of SOAPdenovo2 was used to reassemble, improve and update the previously assembled genome (tools and pipelines available here: <a href="http://dx.doi.org/10.5524/100044" target="_blank">doi:10.5524/100044</a>). By aligning the short reads with SOAP, 177G nucleotides were mapped onto the NCBI reference genome and 99.99% of the genome was covered. The raw sequences, assemblies and relevant tools are released for public use under a <a href="http://creativecommons.org/about/cc0" target="_blank">CC0 license</a>.

More information about the YH genome can be viewed at: <a href="http://yh.genomics.org.cn/" target="_blank">http://yh.genomics.org.cn/</a>', dataset_size = 83751862272, ftp_site = 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/', upload_status = 'Published', excelfile = 'GigaDBUploadForm_SOAPdenovo2.xls', excelfile_md5 = 'f81081445837f1fedd6d980dfa225ce0', publication_date = '2012/12/12', modification_date = null, publisher_id = 3  where id = 40 ; 
delete from dataset_author where dataset_id='40'
insert into dataset_author values( 1264, 40, 1048 );
insert into dataset_author values( 1265, 40, 889 );
insert into dataset_author values( 1266, 40, 639 );
insert into dataset_author values( 1340, 40, 1205 );
insert into dataset_author values( 1370, 40, 1184 );
insert into dataset_author values( 1371, 40, 973 );
insert into dataset_author values( 1372, 40, 1185 );
insert into dataset_author values( 1373, 40, 1186 );
insert into dataset_author values( 1374, 40, 1187 );
insert into dataset_author values( 1375, 40, 1188 );
insert into dataset_author values( 1376, 40, 1189 );
insert into dataset_author values( 1377, 40, 1190 );
insert into dataset_author values( 1378, 40, 1191 );
insert into dataset_author values( 1379, 40, 1192 );
insert into dataset_author values( 1380, 40, 1193 );
insert into dataset_author values( 1381, 40, 1194 );
insert into dataset_author values( 1382, 40, 1195 );
insert into dataset_author values( 1383, 40, 1196 );
insert into dataset_author values( 1384, 40, 1197 );
insert into dataset_author values( 1385, 40, 1198 );
insert into dataset_author values( 1386, 40, 1199 );
insert into dataset_author values( 1387, 40, 1200 );
insert into dataset_author values( 1388, 40, 1201 );
insert into dataset_author values( 1389, 40, 1202 );
insert into dataset_author values( 1390, 40, 1203 );
insert into dataset_author values( 1391, 40, 1204 );
insert into dataset_author values( 1392, 40, 885 );
insert into dataset_author values( 1393, 40, 886 );
delete from relation where dataset_id='40'
insert into relation values( 5, 40, '10.5524/100015', 'IsNewVersionOf' );
delete from link where dataset_id='40'
insert into link values( 82, 40, 'TRUE', 'ENA:ERP001652' );
delete from dataset_type where dataset_id='40'
insert into dataset_type values( 45, 40, 2 );
delete from external_link where dataset_id='40'
insert into external_link values( 23, 40, 'http://yh.genomics.org.cn/', 1 );
insert into external_link values( 24, 40, 'http://yh.genomics.org.cn/mapview.jsp?', 2 );
delete from manuscript where dataset_id='40'
update sample set id = 522, species_id = 7, s_attrs = '', code = 'YH'  where id = 522 ; 
delete from dataset_sample where dataset_id='40'
insert into dataset_sample values( 526, 40, 522 );
delete from file where dataset_id='40'
insert into file values( 12284, 40, 522, 'readme.txt', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/readme.txt', 'txt', 2462, '', '2012/12/12', 1, 1, null );
insert into file values( 12285, 40, 522, 'asm_yanh.scafSeq.closure.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/asm_yanh.scafSeq.closure.gz', 'scafSeq', 857609412, '', '2012/12/12', 2, 3, null );
insert into file values( 12286, 40, 522, '110112_I199_FC819BBABXX_L3_HUMiqvDBTDWAAPE_1.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110112_I199_FC819BBABXX_L3_HUMiqvDBTDWAAPE_1.fq.gz', 'fq', 6397579654, '', '2012/12/12', 7, 9, null );
insert into file values( 12287, 40, 522, '110112_I199_FC819BBABXX_L3_HUMiqvDBTDWAAPE_2.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110112_I199_FC819BBABXX_L3_HUMiqvDBTDWAAPE_2.fq.gz', 'fq', 6395813309, '', '2012/12/12', 7, 9, null );
insert into file values( 12288, 40, 522, '110114_I481_FC81C7HABXX_L5_HUMiqvDBTDIAAPE_1.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110114_I481_FC81C7HABXX_L5_HUMiqvDBTDIAAPE_1.fq.gz', 'fq', 5712296705, '', '2012/12/12', 7, 9, null );
insert into file values( 12289, 40, 522, '110114_I481_FC81C7HABXX_L5_HUMiqvDBTDIAAPE_2.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110114_I481_FC81C7HABXX_L5_HUMiqvDBTDIAAPE_2.fq.gz', 'fq', 5538716867, '', '2012/12/12', 7, 9, null );
insert into file values( 12290, 40, 522, '110114_I481_FC81C7HABXX_L6_HUMiqvDBTDIBAPE_1.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110114_I481_FC81C7HABXX_L6_HUMiqvDBTDIBAPE_1.fq.gz', 'fq', 5432071794, '', '2012/12/12', 7, 9, null );
insert into file values( 12291, 40, 522, '110114_I481_FC81C7HABXX_L6_HUMiqvDBTDIBAPE_2.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110114_I481_FC81C7HABXX_L6_HUMiqvDBTDIBAPE_2.fq.gz', 'fq', 5219295384, '', '2012/12/12', 7, 9, null );
insert into file values( 12292, 40, 522, '110114_I481_FC81C7HABXX_L7_HUMiqvDBTDBAAPE_1.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110114_I481_FC81C7HABXX_L7_HUMiqvDBTDBAAPE_1.fq.gz', 'fq', 6971379107, '', '2012/12/12', 7, 9, null );
insert into file values( 12293, 40, 522, '110114_I481_FC81C7HABXX_L7_HUMiqvDBTDBAAPE_2.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110114_I481_FC81C7HABXX_L7_HUMiqvDBTDBAAPE_2.fq.gz', 'fq', 6589777661, '', '2012/12/12', 7, 9, null );
insert into file values( 12294, 40, 522, '110114_I481_FC81C7HABXX_L8_HUMiqvDBTDBABPE_1.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110114_I481_FC81C7HABXX_L8_HUMiqvDBTDBABPE_1.fq.gz', 'fq', 6955987200, '', '2012/12/12', 7, 9, null );
insert into file values( 12295, 40, 522, '110114_I481_FC81C7HABXX_L8_HUMiqvDBTDBABPE_2.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110114_I481_FC81C7HABXX_L8_HUMiqvDBTDBABPE_2.fq.gz', 'fq', 6564816426, '', '2012/12/12', 7, 9, null );
insert into file values( 12296, 40, 522, '110115_I125_FC81C7KABXX_L3_HUMiqvDBTDLAAPE_1.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110115_I125_FC81C7KABXX_L3_HUMiqvDBTDLAAPE_1.fq.gz', 'fq', 5528746016, '', '2012/12/12', 7, 9, null );
insert into file values( 12297, 40, 522, '110115_I125_FC81C7KABXX_L3_HUMiqvDBTDLAAPE_2.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110115_I125_FC81C7KABXX_L3_HUMiqvDBTDLAAPE_2.fq.gz', 'fq', 5516129852, '', '2012/12/12', 7, 9, null );
insert into file values( 12298, 40, 522, '110115_I270_FC81CBVABXX_L5_HUMiqvDBTDBCAPE_1.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110115_I270_FC81CBVABXX_L5_HUMiqvDBTDBCAPE_1.fq.gz', 'fq', 6316473294, '', '2012/12/12', 7, 9, null );
insert into file values( 12299, 40, 522, '110115_I270_FC81CBVABXX_L5_HUMiqvDBTDBCAPE_2.fq.gz', 'ftp://climb.genomics.cn/pub/10.5524/100001_101000/100038/data/110115_I270_FC81CBVABXX_L5_HUMiqvDBTDBCAPE_2.fq.gz', 'fq', 3459235840, '', '2012/12/12', 7, 9, null );
delete from dataset_project where dataset_id='40'
insert into dataset_project values( 20, 40, 8 );
