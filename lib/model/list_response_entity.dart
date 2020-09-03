import 'package:my_flutter_app/generated/json/base/json_convert_content.dart';

class ListResponseEntity with JsonConvert<ListResponseEntity> {
	ListResponseData data;
	int errorCode;
	String errorMsg;
}

class ListResponseData with JsonConvert<ListResponseData> {
	int curPage;
	List<ListResponseDataData> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class ListResponseDataData with JsonConvert<ListResponseDataData> {
	String apkLink;
	int audit;
	String author;
	bool canEdit;
	int chapterId;
	String chapterName;
	bool collect;
	int courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	int id;
	String link;
	String niceDate;
	String niceShareDate;
	String origin;
	String prefix;
	String projectLink;
	int publishTime;
	int realSuperChapterId;
	int selfVisible;
	int shareDate;
	String shareUser;
	int superChapterId;
	String superChapterName;
	List<ListResponseDataDatasTag> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}

class ListResponseDataDatasTag with JsonConvert<ListResponseDataDatasTag> {
	String name;
	String url;
}
