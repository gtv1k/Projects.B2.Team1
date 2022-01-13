enum Status
{
	Off,
	Continue,
	Success,
	Failure
};

#macro OFF      Status.Off

#macro SUCCES   Status.Success
#macro FAILURE  Status.Failure

#macro CONTINUE Status.Continue