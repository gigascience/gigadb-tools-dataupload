import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.mozilla.javascript.ast.NewExpression;

import Log.Log;

/**
 * 
 */

/**
 * @author þý‹æ£®æ´þý
 * 
 * @date 2012-5-1
 */
public class XmlGenerator {
	Database database;

	XmlGenerator() throws Exception {
		database = new Database();
	}

	//
	void generateXml(String identifier) throws SQLException, IOException {
		String path = "metadataDir/" + identifier.replace("/", "_") + ".xml";
		Log xmlFile = new Log(path, false);
		String id= database.get_result("select id from dataset where identifier="+"'"+identifier+"'", "id");
		
		//ArrayList<String> author_id= database.get_result_more("select author_id from dataset_author where dataset_id="+id, "author_id");
		ArrayList<String> creatorList = new ArrayList<String>();
		
		String statement = "select author.name from author,dataset_author where dataset_author.author_id=author.id  and dataset_author.dataset_id="+ id+ " order by author.rank;";
		ResultSet resultSet1 = database.stmt.executeQuery(statement);
		
		while (resultSet1.next()) {
			String creator = resultSet1.getString(1);
			creatorList.add(creator);
		}
		
		// title
		String query = "select title from dataset where identifier='" + identifier
				+ "';";
		ResultSet resultSet = database.stmt.executeQuery(query);
		
		String title = null;
		while (resultSet.next()) {
			title = resultSet.getString(1);
			
			//title = title.replace("<", "&lt;");
			//title = title.replace(">", "&gt;");
			title= title.replace("<em>", "");
			title= title.replace("</em>", "");
		
			System.out.println("old title  " + title);
			
			title=title.replace(".","");
			
			System.out.println("new title  " + title);
		}
		// publisher
		
		String publisher_id= database.get_result("select publisher_id from dataset where id="+id, "publisher_id");
		query = "select name from publisher where id='" + publisher_id
				+ "';";
		resultSet = database.stmt.executeQuery(query);
		String publisher = null;
		while (resultSet.next()) {
			publisher = resultSet.getString(1);
		}
		// upload_status
		query = "select upload_status from dataset where identifier='" + identifier
				+ "';";
		resultSet = database.stmt.executeQuery(query);
		String upload_status = null;
		while (resultSet.next()) {
			upload_status = resultSet.getString(1);
		}
		// publication_year
		query = "select extract(year from  publication_date) from dataset where identifier='"
				+ identifier + "';";
		resultSet = database.stmt.executeQuery(query);
		String publicationYear = null;
		while (resultSet.next()) {
			publicationYear = resultSet.getString(1);
		}
		
		// publication_date
		query="select publication_date from dataset where identifier='"
				+ identifier + "';";
		resultSet = database.stmt.executeQuery(query);
		String publicationdate = null;
		while (resultSet.next()) {
			publicationdate = resultSet.getString(1);
		}

		// date
		query = "select modification_date from dataset where identifier='"
				+ identifier + "';";
		resultSet = database.stmt.executeQuery(query);
		String modification_date = null;
		while (resultSet.next()) {
			modification_date = resultSet.getString(1);
		}
		// language
		String language = "eng";
		ArrayList<String> subjects = new ArrayList<String>();
		// subject
		String dataset_type_id=database.get_result("select type_id from dataset_type where dataset_id="+id, "type_id");
		query = "select name from type where id='"
				+ dataset_type_id + "';";
		resultSet = database.stmt.executeQuery(query);
		// String
		while (resultSet.next()) {
			subjects.add(resultSet.getString(1));
		}
		// manuscript+doi
		query = "select identifier from manuscript where dataset_id='"
				+ id + "';";
		resultSet = database.stmt.executeQuery(query);
		ArrayList<String> relatedDoiList = new ArrayList<String>();
		while (resultSet.next()) {
			String doi = resultSet.getString(1);
			relatedDoiList.add(doi);
		}
		// relationdoi
		query = "select related_doi from relation where dataset_id='"
				+ id + "';";
		resultSet = database.stmt.executeQuery(query);
		ArrayList<String> relatedDoiList1 = new ArrayList<String>();
		while (resultSet.next()) {
			String doi = resultSet.getString(1);
			relatedDoiList1.add(doi);
		}
		
		
		
		// relationship
		query = "select relationship from relation where dataset_id='"
				+ id + "';";
		resultSet = database.stmt.executeQuery(query);
		ArrayList<String> relationship = new ArrayList<String>();
		while (resultSet.next()) {
			String doi = resultSet.getString(1);
			relationship.add(doi);
		}
		
		// size
		query = "select sum(size) from file where dataset_id='"
				+ id + "';";
		resultSet = database.stmt.executeQuery(query);
		long size = 0;
		while (resultSet.next()) {
			size = resultSet.getLong(1);
		}
		// process size
		// 0: B, 1: KB, 2: MB 3: GB 4. TB
		int level = 0;
		String[] unit = { "B", "KB", "MB", "GB", "TB" };
		// long temp=size;
		while (size >= 512) {
			size = (size + 512) / 1024;
			level++;
		}
		String sizeString = size + " " + unit[level];
		// description
		query = "select description from dataset where identifier='"
				+ identifier + "';";
		resultSet = database.stmt.executeQuery(query);
		String description = null;
		while (resultSet.next()) {
			description = resultSet.getString(1);
			//description = description.replace("<", "&lt;");
			//description = description.replace(">", "&gt;");
		}
		
		description= description.replace("<em>", "");
		description= description.replace("</em>", "");
		
		
		//description= description.replaceAll("<a[^>]*>[\\d\\D]*?>", "");
		description= description.replaceAll("<a href=\"([^\"]*)\"*[\\d\\D]*?>", "");
		description= description.replace("<a >", "");
		description= description.replace("</a>", "");
		
		System.out.print(description);
		// decription type
		String descriptionType = "Abstract";
		// write to file
		String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
				+ "<resource xmlns=\"http://datacite.org/schema/kernel-2.2\" "
				+ "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
				+ "xsi:schemaLocation=\"http://datacite.org/schema/kernel-2.2 "
				+ "http://schema.datacite.org/meta/kernel-2.2/metadata.xsd\">\n";

		xml += "\t<identifier identifierType=\"DOI\">@</identifier>\n".replace(
				"@", identifier);
		xml += "\t<creators>\n";
		for (String creator : creatorList) {
			xml += ("\t\t<creator>\n\t\t\t<creatorName>@</creatorName>\n\t\t</creator>\n")
					.replace("@", creator);
		}
		xml += "\t</creators>\n";
		// title
		xml += "\t<titles>\n\t\t<title>@</title>\n\t</titles>\n".replace("@",
				title);
		xml += "\t<publisher>@</publisher>\n".replace("@", publisher);
		
		//year
		
		if(publicationYear==null)
		{
			xml += "\t<publicationYear>Waiting for published</publicationYear>\n";
			
		}
		else
		{
			xml += "\t<publicationYear>@</publicationYear>\n".replace("@",
			publicationYear);
		}
			
		
		//System.out.print(publicationYear);
		// date
		//xml += "\t<uploadstatus>@</uploadstatus>\n".replace("@", upload_status);
			
		// subject
		if(subjects.size()>0){
			xml += "\t<subjects>\n";
			for(int i=0;i<subjects.size();i++){
				xml+="\t\t<subject>"+subjects.get(i)+"</subject>\n";
			}
			xml += "\t</subjects>\n";
		}
		
		xml += "\t<dates>\n";
		xml += "\t<date dateType=\"Available\">@</date>\n".replace("@",publicationdate);
		if (modification_date != null) {
			xml += "\t<date dateType=\"Updated\">@</date>\n".replace("@",
					modification_date);
		}
		xml += "\t</dates>\n";
		//language		
		xml += "\t<language>@</language>\n".replace("@", language);
		// resourceType
		xml += "\t<resourceType resourceTypeGeneral=\"Dataset\">GigaDB Dataset</resourceType>\n";
		xml += "\t<relatedIdentifiers>\n";
		if (relatedDoiList.size() != 0) {
			
			for (String relatedidentifier : relatedDoiList) {
				xml += ("\t\t<relatedIdentifier relatedIdentifierType=\"DOI\" relationType=\"IsReferencedBy\">"
						+ "@</relatedIdentifier>\n").replace("@",
						relatedidentifier);
			}
		}
			// Add part 
	
		if (relatedDoiList1.size() != 0) {
			int i=0;
			
			for (String relatedidentifier : relatedDoiList1) {
				String relationship1=relationship.get(i);
				i++;
				xml += ("\t\t<relatedIdentifier relatedIdentifierType=\"DOI\" relationType=\"$\">"
						+ "@</relatedIdentifier>\n").replace("@",
						relatedidentifier).replace("$",relationship1);
		}
		}
			xml += "\t</relatedIdentifiers>\n";
		//}
		// // relatedIdentifierTYpe
	//	 xml +="\t<relatedIdentifierType> relatedIdentifierType=\"DOI\" relationType="@".replace(
		// "@", "DOI");
		// xml += "\t<relationType>@</relationType>\n".replace("@", "Cites");
		// size
		xml += "\t<sizes>\n\t\t<size>@</size>\n\t</sizes>\n".replace("@",
				sizeString);
		xml += "\t<rights>http://creativecommons.org/publicdomain/zero/1.0/</rights>\n";
		xml += "\t<descriptions>\n\t\t<description descriptionType=\"Abstract\">@</description>\n\t</descriptions>\n"
				.replace("@", description);

		//
		xml += "</resource>\n";
		xmlFile.writeLine(xml);
	}

	public static void main(String[] args) throws Exception {
		// XmlGenerator xmlGenerator = new XmlGenerator();
		// xmlGenerator.generateXml("10.5524/100003",
		// "metadataDir/metadata.xml");
		if (args.length > 0) {
			XmlGenerator xmlGenerator = new XmlGenerator();
			System.out.println("get outside arguments!");
			System.out.println(args[0]);
			String identifier = args[0];
			xmlGenerator.generateXml(identifier);
			return;
		}
		XmlGenerator xmlGenerator = new XmlGenerator();
		//xmlGenerator.generateXml("10.5524/100031");
		xmlGenerator.generateXml("10.5524/100038");
	}
}
