class DeviseCreateJobSeekers < ActiveRecord::Migration
  def self.up
    create_table(:job_seekers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :job_seekers, :email,                :unique => true
    add_index :job_seekers, :reset_password_token, :unique => true
    # add_index :job_seekers, :confirmation_token,   :unique => true
    # add_index :job_seekers, :unlock_token,         :unique => true
    # add_index :job_seekers, :authentication_token, :unique => true
  end

  def self.down
    drop_table :job_seekers
  end
end
