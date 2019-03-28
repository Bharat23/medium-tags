install.packages('rvest');
install.packages('textcat');
require('rvest');
require('textcat');

data = read.csv('./Medium_Clean.csv', stringsAsFactors = FALSE);

contentList = data.frame();
for (i in seq(1, 100)) {
  url = as.vector(data[i, 'url']);
  contentList[i, 'url'] = url;
  texts = tryCatch({
    webpage = read_html(url);
    pTags = html_nodes(webpage, 'p');
    pText = html_text(pTags);
    language = textcat::textcat(pText);
    if (!is.na(language[1]) && language[1] == 'english') {
      print('here')
      pText;
    } else {
      msg = NA;
      msg;
    }
  }, error = function(error_condition) {
    print(error_condition)
    msg = NA;
    msg;
  });
  contentList[i, 'content'] = paste(texts, sep = " ", collapse = " ");
}


new_data=merge(data[1:100,], contentList, by.y = "url");
new_data_filter_1 = filter(new_data, new_data['content'] != 'NA')
new_data_filter_2 = filter(new_data, new_data['content'] != 'bad html')

write.csv(new_data_filter_1, file = "MyData.csv")