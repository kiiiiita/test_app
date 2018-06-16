class Role < ActiveHash::Base
    self.data = [
      {id: 1, name: '管理者'},
      {id: 2, name: '営業'},
      {id: 3, name: 'Sクラスユーザー'},
      {id: 4, name: 'Mクラスユーザー'},
      {id: 5, name: 'Lクラスユーザー'},
    ]
  end