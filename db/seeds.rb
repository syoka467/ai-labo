# AiProductのテストデータを挿入
ai_product1 = AiProduct.create(product_name: "AI Product 1")
ai_product2 = AiProduct.create(product_name: "AI Product 2")
ai_product3 = AiProduct.create(product_name: "AI Product 3")
# Purposeのテストデータを挿入
purpose1 = Purpose.create(purpose: "Purpose 1")
purpose2 = Purpose.create(purpose: "Purpose 2")
purpose3 = Purpose.create(purpose: "Purpose 3")
# AiProductとPurposeの関連付けを行う
ai_product1.purposes << [purpose1, purpose2]
ai_product2.purposes << [purpose2]
ai_product3.purposes << [purpose3]
