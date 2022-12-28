function changeCatFact(elem) {
  $.ajax({
    type: 'GET',
    dataType: 'json',
    url: $(elem).data('getFactUrl'),
    crossDomain: true,
    success: (data) => {
      const factBody = $('.nn-cat-fact-container').find('h2');
      factBody.html(data['body']['fact']);
      factBody.data('factId', data['body']['fact_id']);
      if (data['body']['liked_fact']) {
        $('#nn-like-fact-btn').addClass('disabled');
      } else if ($('#nn-like-fact-btn').hasClass('disabled')) {
        $('#nn-like-fact-btn').removeClass('disabled');
      }
    },
  });
}

function likeCatFact(elem) {
  const factBody = $('.nn-cat-fact-container').find('h2');
  const userId = factBody.data('userId');
  const factId = factBody.data('factId')
  $.ajax({
    type: 'POST',
    dataType: 'json',
    url: `${$(elem).data('likeFactUrl')}?user_id=${userId}&fact_id=${factId}`,
    crossDomain: true,
    success: () => {
      changeCatFact('#nn-change-fact-btn');
    },
  });
}