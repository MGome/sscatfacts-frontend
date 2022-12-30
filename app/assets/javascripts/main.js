function changeCatFact(elem) {
  disableButtons();
  $.ajax({
    type: 'GET',
    dataType: 'json',
    url: $(elem).data('getFactUrl').replace('api', 'localhost'),
    crossDomain: true,
    success: (data) => {
      const factBody = $('.nn-cat-fact-container').find('h2');
      factBody.html(data['body']['fact']);
      factBody.data('factId', data['body']['fact_id']);
      $(elem).hasClass('disabled') && $(elem).removeClass('disabled');
      if (data['body']['liked_fact']) {
        !$('#nn-like-fact-btn').hasClass('disabled') && $('#nn-like-fact-btn').addClass('disabled');
      } else if ($('#nn-like-fact-btn').hasClass('disabled')) {
        $('#nn-like-fact-btn').removeClass('disabled');
      }
    },
  });
}

function likeCatFact(elem) {
  !$(elem).hasClass('disabled') && $(elem).addClass('disabled');
  const factBody = $('.nn-cat-fact-container').find('h2');
  const userId = factBody.data('userId');
  const factId = factBody.data('factId')
  $.ajax({
    type: 'POST',
    dataType: 'json',
    url: `${$(elem).data('likeFactUrl').replace('api', 'localhost')}?user_id=${userId}&fact_id=${factId}`,
    crossDomain: true,
    success: () => {
      changeCatFact('#nn-change-fact-btn');
    },
  });
}

function disableButtons() {
  !$('#nn-change-fact-btn').hasClass('disabled') && $('#nn-change-fact-btn').addClass('disabled');
  !$('#nn-like-fact-btn').hasClass('disabled') && $('#nn-like-fact-btn').addClass('disabled');
}