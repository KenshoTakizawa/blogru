class Category < ActiveHash::Base
  self.data= [
    { id: 1, name: '--' },
    { id: 2, name: 'SEOの練習' },
    { id: 3, name: 'コピーライティングの練習' },
    { id: 4, name: '記事作成に役立つ知識' },
    { id: 5, name: '役立つ知識' },
    { id: 6, name: '趣味' },
    { id: 7, name: 'スポーツ' },
    { id: 8, name: 'ゲーム' },
    { id: 9, name: 'アニメ' },

  ]
end
