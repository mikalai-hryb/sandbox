namespace Currencies.Handlers
{
    public interface IBaseHandler
    {
        public string OptionText { get; }
        public void Handle();
    }
}
