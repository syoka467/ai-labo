document.addEventListener('DOMContentLoaded', function() {
  // カテゴリリストのトグル設定
  const toggleCategoryButton = document.getElementById('toggle-category-list');
  const categoryList = document.getElementById('category-list');
  const categoryOptions = document.querySelectorAll('#category-list .filter-option');

  // 利用目的リストのトグル設定
  const togglePurposeButton = document.getElementById('toggle-purpose-list');
  const purposeList = document.getElementById('purpose-list');
  const purposeOptions = document.querySelectorAll('#purpose-list .filter-option');

  // 最初に表示するオプション数
  const initialVisibleCount = 5;

  // カテゴリリストの初期設定
  for (let i = 0; i < initialVisibleCount && i < categoryOptions.length; i++) {
    categoryOptions[i].classList.add('visible');
  }

  toggleCategoryButton.addEventListener('click', function() {
    categoryList.classList.toggle('expanded');
    if (categoryList.classList.contains('expanded')) {
      toggleCategoryButton.textContent = 'カテゴリを隠す';
      categoryOptions.forEach(option => option.classList.add('visible'));
    } else {
      toggleCategoryButton.textContent = 'カテゴリを表示';
      for (let i = initialVisibleCount; i < categoryOptions.length; i++) {
        categoryOptions[i].classList.remove('visible');
      }
    }
  });

  // 利用目的リストの初期設定
  for (let i = 0; i < initialVisibleCount && i < purposeOptions.length; i++) {
    purposeOptions[i].classList.add('visible');
  }

  togglePurposeButton.addEventListener('click', function() {
    purposeList.classList.toggle('expanded');
    if (purposeList.classList.contains('expanded')) {
      togglePurposeButton.textContent = '利用目的一覧を隠す';
      purposeOptions.forEach(option => option.classList.add('visible'));
    } else {
      togglePurposeButton.textContent = '利用目的一覧を表示';
      for (let i = initialVisibleCount; i < purposeOptions.length; i++) {
        purposeOptions[i].classList.remove('visible');
      }
    }
  });
});
