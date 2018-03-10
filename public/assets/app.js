/**
 * Shows links to predicted pages. Doing that, the user can follow prediction
 * in order to see how Sirko Engine improves user experience.
 */
function printPrediction(prediction) {
  var ul = document.querySelector('#predicted_pages ul'),
      html = '';

  if (prediction.length) {
    prediction.forEach(function(page) {
      var template = '<li class="list-group-item">' +
        '<span class="badge">{confidence}</span>' +
        '<a href="{path}">{path}</a>' +
        '</li>';

      var confidence = (page.confidence + '').substr(0, 5);

      template = template.replace(/{path}/g, page.path);
      html += template.replace(/{confidence}/, confidence)
    });
  }
  else {
    html = '<li class="list-group-item">No prediction for this page</li>';
  }

  ul.innerHTML = html;

  // store the html, thus, it can be used if a user refreshes a page.
  sessionStorage.setItem('predictionList', html);
  sessionStorage.setItem('predictionFor', window.location.href);
};
