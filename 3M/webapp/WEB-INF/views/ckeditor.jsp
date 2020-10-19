<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="robots" content="noindex, nofollow">
  <title>Accessibility Checker</title>
  <script src="https://cdn.ckeditor.com/4.15.0/standard-all/ckeditor.js"></script>
</head>

<body>
  <script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
  <textarea cols="80" id="editor1" name="editor1" rows="10" data-sample-short>&lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;. You are using &lt;a href=&quot;https://ckeditor.com/&quot;&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;</textarea>
  <script>
    CKEDITOR.plugins.addExternal('a11ychecker', 'https://ckeditor.com/docs/ckeditor4/4.15.0/examples/assets/plugins/a11ychecker/', 'plugin.js');

    // Performance optimization:
    // Send a request for tests JSON file ASAP, so it's likely to be ready when the user runs Acessibility Checker.
    $.getJSON('https://ckeditor.com/docs/vendors/4.15.0/ckeditor/assets/plugins/a11ychecker/libs/quail/tests.json');

    CKEDITOR.replace('editor1', {
      extraPlugins: 'a11ychecker',
      removePlugins: 'scayt,wsc',
      height: 500,
      a11ychecker_quailParams: {
        jsonPath: 'assets/plugins/a11ychecker/libs/quail',
        // Override Accessibility Checker guidelines from the default configuration.
        guideline: [
          'imgNonDecorativeHasAlt',
          'imgImportantNoSpacerAlt',
          'aTitleDescribesDestination',
          'aAdjacentWithSameResourceShouldBeCombined',
          'aImgAltNotRepetitive',
          'aMustNotHaveJavascriptHref',
          'aSuspiciousLinkText',
          'blockquoteNotUsedForIndentation',
          'documentVisualListsAreMarkedUp',
          'headerH1',
          'headerH2',
          'headerH3',
          'headerH4',
          'imgAltIsDifferent',
          'imgAltIsTooLong',
          'imgAltNotEmptyInAnchor',
          'imgAltTextNotRedundant',
          'imgHasAlt',
          'imgShouldNotHaveTitle',
          'linkHasAUniqueContext',
          'pNotUsedAsHeader',
          'tableDataShouldHaveTh',
          'imgWithEmptyAlt'
        ]
      },
      contentsCss: [
        'http://cdn.ckeditor.com/4.15.0/full-all/contents.css',
        'https://ckeditor.com/docs/vendors/4.15.0/ckeditor/assets/accessibilitychecker/contents.css'
      ]
    });
  </script>
</body>

</html>