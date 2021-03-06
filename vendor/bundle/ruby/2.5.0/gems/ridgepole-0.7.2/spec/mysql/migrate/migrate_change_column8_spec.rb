describe 'Ridgepole::Client#diff -> migrate' do
  before { subject.diff(actual_dsl).migrate }
  subject { client(:table_options => table_options, :dump_without_table_options => dump_without_table_options) }

  let(:warning_regexp) { /table options differ/ }
  let(:dump_without_table_options) { false }

  let(:actual_dsl) {
    erbh(<<-EOS)
      create_table "employees", primary_key: "emp_no", force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      end
    EOS
  }

  let(:expected_dsl) {
    erbh(<<-EOS)
      create_table :employees, primary_key: :emp_no, force: :cascade do |t|
      end
    EOS
  }

  context 'when change options (no change)' do
    let(:table_options) { 'ENGINE=InnoDB DEFAULT CHARSET=utf8' }

    it {
      expect(Ridgepole::Logger.instance).to_not receive(:warn).with(warning_regexp)
      delta = subject.diff(expected_dsl)
      expect(delta.differ?).to be_falsey
    }
  end

  context 'when change options (change)' do
    let(:table_options) { 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' }

    it {
      expect(Ridgepole::Logger.instance).to receive(:warn).with(warning_regexp)
      delta = subject.diff(expected_dsl)
      expect(delta.differ?).to be_falsey
    }
  end

  context 'when dump_without_table_options => true' do
    let(:table_options) { 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' }
    let(:dump_without_table_options) { true }

    it {
      expect(Ridgepole::Logger.instance).to_not receive(:warn)
      delta = subject.diff(expected_dsl)
      expect(delta.differ?).to be_falsey
    }
  end
end
