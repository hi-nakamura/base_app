class CustomDevise::RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def new
    # ルーティング上、呼ばれることはないが念のため
  end

  # POST /resource
  def create
    # ユーザ登録はさせない
  end

  # DELETE /resource
  def destroy
    # ユーザ削除させない
  end
end
