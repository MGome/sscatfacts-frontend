function changeCatFact(elem) {
  $.ajax({
    type: 'GET',
    dataType: 'json',
    url: $(elem).data('getFactUrl'),
    crossDomain: true,
    success: (data) => {
      $('.nn-cat-fact-container').find('h2').html(data['body']['fact'])
    },
  });
}