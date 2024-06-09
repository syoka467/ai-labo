require 'mechanize'
require 'openai'

class Scrape_ai_products
  #Scrape_ai_products.runScraper
  #カテゴリーページからURLをとってくる
  def self.runScraper
    service_urls = []
    agent = Mechanize.new
    current_page = agent.get("https://aismiley.co.jp/category_page/")
    target_category_counts = current_page.search('/html/body/main/div[2]/div[1]/section[1]/div/div[2]/div/div/div/ul/li').length

    (0..target_category_counts-1).each do |i|
      target_caregory_class = current_page.search('.searchCat__item a')[i]
      target_caregory_url = target_caregory_class[:href]
      target_agent = Mechanize.new
      category_page = target_agent.get(target_caregory_url)
      category_page_counts = category_page.search('.page-numbers').length - 1
      
      if(category_page_counts == -1)then
        category_page_counts = 1
      end

      (1..category_page_counts).each do |p|
        target_page_agent = Mechanize.new
        target_page = target_page_agent.get(target_caregory_url + 'page/'+ p.to_s) 
        service_url_elements = target_page.search('.seekArticle__headline a')
        service_url_elements_counts = service_url_elements.length
        
        (0..service_url_elements_counts-1).each do |s|
          service_urls.push(service_url_elements[s][:href])
        end

      end
    end
    uniq_service_urls = service_urls.uniq
    getEachElementFromLink(uniq_service_urls)
    
  end
  #URLから必要な要素を取得
  def self.getEachElementFromLink(links)
    agent = Mechanize.new
    uniq_service_urls = links
    # uniq_service_urls = ['https://aismiley.co.jp/product/risk-return-model/']
    uniq_service_urls_counts = uniq_service_urls.length
    purposes = []    
    target_industries = []
    target_companies = []
    categories = []
    (0..uniq_service_urls_counts-1).each do |i|
      current_page = agent.get(uniq_service_urls[i])
      company_name = current_page.search('.companyHead__headline').inner_text if(current_page.search('.companyHead__headline'))
      company_theme = current_page.search('.theme') if(current_page.search('.theme'))
      company_description = current_page.search('.description') if(current_page.search('.description'))
      company_theme_count = company_theme.length
      product_name = current_page.search('.summaryHead__headline').inner_text
      #説明文とかが一切入っていないページを判定
      if company_theme.length == 0 then
        next
      end
      purposes_count = (current_page.search('.tagList__item').length)
      company_name =  company_name.gsub(" ", "").gsub(/[\r\n]/,"")
      capital = company_description[10].inner_text
      establishment_date = company_description[11].inner_text
      employee_type = company_description[12].inner_text
      business_description = company_description[13].inner_text.gsub(" ", "").gsub(/[\r\n]/,"")
      product_name =  product_name.gsub(" ", "").gsub(/[\r\n]/,"")
      description = company_description[4].inner_text.gsub(" ", "").gsub(/[\r\n]/,"")
      usag_fee_scrape = company_description[0].inner_text
      usag_fee_type = ''
      usage_fee = ''


      target_company = current_page.search('.tagList')[2]
      target_company_list = target_company.search('.tagList__item').length

      (0..target_company_list - 1).each do |d|
        target_company_text = target_company.search('.tagList__item')[d].inner_text
        target_companies.push(target_company_text)
      end

        #Scrape_company.getEachElementFromLink
      #   purpose = current_page.search('.tagList')[0]
      #   purpose_count = purpose.search('.tagList__item').length
      # (0..purpose_count-1).each do |h|
      #   purpose_text = purpose.search('.tagList__item')[h].inner_text
      #   purposes.push(purpose_text)
      # end
      # chat_gpt_text = runApi(product_name,description,purpose,target_companies)
      # begin
      #   ai_product_id = AiProduct.find_by(product_name: product_name).id
      # rescue
      # end
      # chat_gpt_i = ChatGptAiProductsIntroduction.new
      # chat_gpt_i.ai_product_id = ai_product_id
      # chat_gpt_i.introduction = chat_gpt_text
      # chat_gpt_i.save

      #利用料金を綺麗にする。

      # if usag_fee_scrape.include?('月額')
      #   usag_fee_type = '月額'
      # elsif usag_fee_scrape.include?('人')
      #   usag_fee_type = 'ユーザー'
      # elsif usag_fee_scrape.include?('年')
      #   usag_fee_type = '年間'
      # else
      #   usag_fee_type = 'その他'
      # end

      # if usag_fee_scrape.include?('お問') || usag_fee_scrape.include?('見積') || usag_fee_scrape.include?('相談')
      #   usage_fee = nil
      # elsif usag_fee_scrape.include?('万')
      #   usage_fee = usag_fee_scrape.gsub(/(\d+)万/) { ($1.to_i * 10_000).to_s }
      # elsif usag_fee_type == 'その他'
      #   usage_fee = nil
      # else
      #   usage_fee = usag_fee_scrape
      # end

      # if usage_fee == nil
        
      # elsif usage_fee.include?(",")
      #   usage_fee = usage_fee.gsub(",", "")
      # end
      # usage_fee_text =  usage_fee
      # if usage_fee =~ /\d/
      #   usage_fee = usage_fee.match(/\d+/)
      # end

      # if usage_fee.to_s =~ /^\d$/
      #   usage_fee = usage_fee_text.scan(/\d+/)[1]
      # elsif usage_fee_text == nil
      # end
      
      # if usage_fee == nil
      # elsif usage_fee.to_s.include?('数十万円～') || usage_fee.to_s == '502'
      #   usage_fee = nil
      # elsif usage_fee.to_s.include?('月額５万円〜')
      #   usage_fee = 50000
      # elsif usage_fee.to_s == '20'
      #   usage_fee = 3980
      # else
      # end

      initial_cost = company_description[1].inner_text
      initial_cost_search = ''
      initial_cost_display = ''
      #初期費用を綺麗にする。

      # if initial_cost.include?("万円")
      #   initial_cost = initial_cost.gsub!(/(\d+)万円/) { |match| ($1.to_i * 10_000).to_s }
      #   initial_cost = initial_cost.gsub(/\D/, '')
      #   initial_cost_display = initial_cost
      #   initial_cost_search  = true
      # elsif initial_cost.include?("円")
      #   initial_cost = initial_cost.gsub(/\D/, '')
      #   initial_cost_display = initial_cost
      # elsif initial_cost == 0
      #   initial_cost_search = false
      # elsif initial_cost.include?("お問") || initial_cost.include?("見積") || initial_cost.include?("要")
      #   initial_cost = nil
      #   initial_cost_search = nil
      #   initial_cost_display = nil
      # elsif initial_cost == 'なし'
      #   initial_cost = 'なし'
      #   initial_cost_display = 0
      #   initial_cost_search = false
      # else
      #   initial_cost = 'なし'
      #   initial_cost_display = 0
      #   initial_cost_search = false
      # end
      
      # if initial_cost_display == nil
      #   initial_cost_search = nil
      # elsif initial_cost_display == 0 || initial_cost_display == '0'
      #   initial_cost_search = false
      # elsif initial_cost_display.include?('36000003250000') || initial_cost_display.include?('150000900000') || initial_cost_display.include?('3006000000') || initial_cost_display.include?('1000004000') || initial_cost_display == '1000'|| initial_cost_display == '10' || initial_cost_display == '03000000' || initial_cost_display == '10'
      #   initial_cost_display = nil
      #   initial_cost_search = nil
      # elsif initial_cost_display.include?('698')
      #   initial_cost_display = 698000
      #   initial_cost_search = true
      # elsif initial_cost_display.include?('900001500001')
      #   initial_cost_display = 90000
      #   initial_cost_search = true
      # else
      #   initial_cost_search = true
      #   initial_cost_display = initial_cost_display.to_i
      # end
      # faq_question_count = current_page.search('.faq__question').length
      # faq_question = current_page.search('.faq__question')
      # faq_answer = current_page.search('.faq__answer')
      # faq = []
      # (0..faq_question_count-1).each do |s|
      #   faq.push(faq_question[s].inner_text+faq_answer[s].inner_text.gsub(" ", ""))
      # end
      # puts faq
      # 無料トライアル有無
      # free_plan = company_description[2].inner_text
      # if free_plan == 'なし' then
      #   free_plan = true
      # elsif free_plan == 'あり' then
      #   free_plan = false
      # else
      #   free_plan = nil
      # end
      # trial = company_description[3].inner_text
      # if trial.include?("あり") then
      #   trial = true
      # elsif trial.include?("なし") then
      #   trial = false
      # else
      #   trial = nil
      # end

      # chat_gpt_text = runApi(product_name,description)

      # ai_product = AiProduct.new
      # ai_product = AiProduct.find_by(product_name: product_name)
      
      # id = ai_product.id
      # puts id
      # begin
      #   a = ai_product.company_name
      # rescue
      #   # ai_product_new = AiProduct.new
      #   # ai_product_new.company_name = company_name
      #   # ai_product_new.capital = capital
      #   # ai_product_new.establishment_date = establishment_date
      #   # ai_product_new.employee_type = employee_type
      #   # ai_product_new.business_description = business_description
      #   # ai_product_new.product_name = product_name
      #   # ai_product_new.description = description
      #   # ai_product_new.usag_fee_scrape = usag_fee_scrape
      #   # ai_product_new.usage_fee_type = usag_fee_type
      #   # ai_product_new.usage_fee = usage_fee
      #   # ai_product_new.initial_cost = initial_cost
      #   # ai_product_new.initial_cost_search = initial_cost_search
      #   # ai_product_new.initial_cost_display = initial_cost_display
      #   # ai_product_new.faq = faq
      #   # ai_product_new.free_plan = free_plan
      #   # ai_product_new.trial = trial
      #   # ai_product_new.save
      # end

      # end


      # puts ai_product_id
      # puts faq
      # ai_product.company_name = company_name
      # ai_product.capital = capital
      # ai_product.establishment_date = establishment_date
      # ai_product.employee_type = employee_type
      # ai_product.business_description = business_description
      # ai_product.product_name = product_name
      # ai_product.description = description
      # puts usag_fee_scrape
      # ai_product.usag_fee_scrape = usag_fee_scrape
      # ai_product.usage_fee_type = usag_fee_type
      # ai_product.usage_fee = usage_fee
      # ai_product.initial_cost = initial_cost
      # ai_product.initial_cost_search = initial_cost_search
      # ai_product.initial_cost_display = initial_cost_display
      # ai_product.faq = faq
      # ai_product.free_plan = free_plan
      # ai_product.trial = trial
      # ai_product.save
      # begin
      #   ai_product.save!
      # rescue ActiveRecord::RecordInvalid => e
      #   puts e.message
    end
    #パーパスとかをユニークにするため

    # purposes = purposes.uniq
    # categories = categories.uniq
    # categories_length = categories.length

    # (0..categories_length-1).each do |n|
    #   a = Category.new
    #   a.category = categories[n]
    #   a.save
    # end


  end
  # Scrape_ai_products.test 小さいテストをする用
  def self.test()
    image_files = (1..30).map { |i| "製品画像#{i}.jpeg" }

    AiProduct.all.each do |product|
      random_image = image_files.sample
      # puts product
      product.update(image: random_image)
    end
  end

  #チャットGPTのAPIを使用
  def self.runApi(product_name,description,purpose,target_company)
    api_key = ENV['OPENAI_API_KEY']
    client = OpenAI::Client.new(access_token: api_key)

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "user", content: "あなたは年間1000本の製品紹介文を執筆しているライターです。
            これから与える下記条件に沿って、500文字程度の製品紹介文章を執筆して欲しいです。<br> 
            注意点として、送った内容の事実以外を使用しないこと「誇張をしないこと（革新などの言い切りをやめてください）」、SEOを考慮すること、読者の関心を引きつけて製品に興味を持ってもらい、購買意欲を高めること、書き方を毎回変更しないことです。
                #{product_name}#{description}#{purpose}#{target_company}"
          }]})

    # puts response.dig("choices", 0, "message", "content")
    return response.dig("choices", 0, "message", "content")
  end
end

##カテゴリーと製品紐付け
      # category = current_page.search('.catList__item a').inner_text.gsub(" ", "").gsub(/[\r\n]/,"")
      # begin
      #   cate = Category.find_by(category: category).id
      #   cate_ai = AiProductsCategory.new
      #   cate_ai.ai_prodcut_id = ai_product_id
      #   cate_ai.category_id = cate
      #   cate_ai.save
      # rescue
      #   puts ('えらーーーーー')
      #   puts category
      # end

      
      # target_industry = current_page.search('.tagList')[1]
      # target_industry_list = target_industry.search('.tagList__item').length
      # (0..target_industry_list - 1).each do |t|
      #   target_industry_text = target_industry.search('.tagList__item')[t].inner_text
      #   begin
      #     target_industry_table_id = TargetIndustry.find_by(target_industry: target_industry_text).id
      #     ai_ti_table = AiProductsTargetIndustry.new
      #     ai_ti_table.ai_product_id = ai_product_id
      #     ai_ti_table.target_industry_id = target_industry_table_id
      #     ai_ti_table.save
      #     # ai_p_table.destroy
      #   rescue

      #   end
      # end

#チャットGPTの紐付けスクリプト
        # ai_product_id = AiProduct.find_by(product_name: product_name).id
        # Purpose.find_by(purpose: )
        # a = (current_page.search('.tagList__item')[b].inner_text)
        # puts a
        # s = Purpose.find_by(purpose: a).id
        # product_purpose = AiProductsPurpose.new
        # product_purpose.ai_product_id= ai_product_id
        # product_purpose.purpose_id = s
        # product_purpose.save