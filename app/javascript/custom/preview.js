// プレビュー
/*
document.addEventListener('DOMContentLoaded', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#image_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#post_img").change(function(){
    readURL(this);
  });
 });
*/
 // プレビュー表示機能は新規投稿("/new/")か投稿編集("/edit/")ページでのみ有効にする
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    // プレビューを表示するための要素を取得
    const ImageList = document.getElementById('image_prev');

    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      // img要素のsrc属性の値をセット
      blobImage.setAttribute('src', blob);

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('post_prev').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する（編集ページ用）
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      // 発火したイベントeの中の、targetの中の、filesという配列に格納された画像を変数に代入
      const file = e.target.files[0];
      // 画像のURLを生成
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}
   
   /*
   document.addEventListener('DOMContentLoaded', function(){
     // 新規投稿・編集ページのフォームを取得
     const postForm = document.getElementById('new_post');
     // プレビューを表示するためのスペースを取得
     const previewList = document.getElementById('previews');
     // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
     if (!postForm) return null;
   
     // input要素を取得。name情報は検証ツールから確認すること！！
     const fileField = document.querySelector('input[type="file"][name="post[post_image]"]');
     // input要素で値の変化が起きた際に呼び出される関数
     fileField.addEventListener('change', function(e){
     // 古いプレビューが存在する場合は削除(最後に記述する)
     const alreadyPreview = document.querySelector('.preview');
     if (alreadyPreview) {
       alreadyPreview.remove();
     };
     // 取得した画像ファイルの情報は、変数fileに格納する
     const file = e.target.files[0];
     // 取得した画像情報のURLを生成(生成されたURLはblobという変数に代入)
     const blob = window.URL.createObjectURL(file);
     // 画像を表示するためのdiv要素を生成
     const previewWrapper = document.createElement('div');
     previewWrapper.setAttribute('class', 'preview');
     // 表示する画像を生成
     const previewImage = document.createElement('img');
     previewImage.setAttribute('class', 'preview-image');
     // setAttributeメソッドを用いて生成したimg要素のsrc属性へ変数blobを設定する
     previewImage.setAttribute('src', blob);
     // 生成したHTMLの要素をブラウザに表示させる
     previewWrapper.appendChild(previewImage);
     previewList.appendChild(previewWrapper);
   
     });
   });
   */